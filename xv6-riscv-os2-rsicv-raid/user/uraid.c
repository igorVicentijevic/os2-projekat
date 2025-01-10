#include "kernel/types.h"
#include "kernel/fs.h"

#include "user/user.h"

#define SIZE_OF_DISK_MB 128UL



static struct RAID{
    enum RAID_TYPE raidType;
    uint numOfBlocksPerDisk;
    uint numOfDisks;
    uint sizeOfBlock;
    uint isInitialized;


} raidInfo;

static struct DISK{
    int isOk;
} disks[DISKS];

int write_raid0(int blkn, uchar* data);
int read_raid0(int blkn, uchar* data);

int write_raid1(int blkn, uchar* data);
int read_raid1(int blkn, uchar* data);

int write_raid10(int blkn, uchar* data);
int read_raid10(int blkn, uchar* data);

int init_raid(enum RAID_TYPE raid){
    raidInfo.raidType = raid;
    raidInfo.numOfDisks = DISKS; //promeniti sa promenom broja diskova
    raidInfo.sizeOfBlock = BSIZE;
    raidInfo.numOfBlocksPerDisk = (SIZE_OF_DISK_MB * 1000000)/BSIZE;
    raidInfo.isInitialized = 1;

    for(int i = 0; i < DISKS; i++){
        disks[i].isOk = 1;
    }

    return 0;
}

int destroy_raid(){
    raidInfo.isInitialized = 0;

}

int info_raid(uint *blkn, uint *blks, uint *diskn){
    if(!raidInfo.isInitialized) return -1;

    *blkn = raidInfo.numOfBlocksPerDisk;
    *blks = raidInfo.sizeOfBlock;
    *diskn = raidInfo.numOfDisks;
    return 0;
}

int disk_fail_raid(int diskn){

    disks[diskn-1].isOk = 0;
    return 0;
}
int disk_repaired_raid(int diskn){
    disks[diskn-1].isOk = 1;
    return 0;
}

int write_raid(int blkn, uchar* data){

    if(raidInfo.isInitialized==0) return -1;

    switch(raidInfo.raidType){
        case RAID0:
            return write_raid0(blkn,data);
        case RAID1:
            return write_raid1(blkn,data);
        case RAID0_1:
            return write_raid10(blkn,data);
        default:


    }

    return -1;
}

int read_raid(int blkn, uchar* data){
    if(raidInfo.isInitialized==0) return -1;

    switch(raidInfo.raidType){
        case RAID0:
            return read_raid0(blkn,data);
        case RAID1:
            return read_raid1(blkn,data);
        case RAID0_1:
            return read_raid10(blkn,data);
        default:
    }

    return 0;
}

int write_raid0(int blkn, uchar* data){
    int d = blkn% raidInfo.numOfDisks;
    int b = blkn / raidInfo.numOfDisks;


    if(b >= raidInfo.numOfBlocksPerDisk) return -2;

    wrtblk(d+1,b,data);
    return 0;
}

int read_raid0(int blkn, uchar* data){
    int d = blkn% raidInfo.numOfDisks;
    int b = blkn / raidInfo.numOfDisks;

    if(b >= raidInfo.numOfBlocksPerDisk) return -2;

    rdblk(d+1,b,data);
    return 0;
}

int write_raid1(int blkn, uchar* data){
    if(blkn < 0 || blkn>= raidInfo.numOfBlocksPerDisk) return -1;


    int ret = -1;
    for(int i = 0; i < raidInfo.numOfDisks; i++) {
        if (!disks[i].isOk) continue;

        wrtblk(i+1, blkn, data);
        ret = 0;
    }

    return ret;
}
int read_raid1(int blkn, uchar* data){
    if(blkn < 0 || blkn>= raidInfo.numOfBlocksPerDisk) return -1;

    for(int i = 0; i < raidInfo.numOfDisks; i++)
    {
        if(!disks[i].isOk) continue;

        rdblk(i+1,blkn,data);
        return 0;
    }
    printf("\nread_raid1 failed\n");
    return -1;
}

int getNumOfRaid10Pairs(){
    return raidInfo.numOfDisks/2;
}

int getRaid10Pair(int d){

    return (d & 1)? d-1: d+1;
}

int write_raid10(int blkn, uchar* data){
    int pair = blkn % getNumOfRaid10Pairs();
    int d1 = pair *2;
    int d2 = getRaid10Pair(d1);
    int b = blkn/getNumOfRaid10Pairs();

    if(b<0 || b>= raidInfo.numOfBlocksPerDisk) return -1;

    int ret = -1;
    if(disks[d1].isOk) {
        wrtblk(d1 + 1, b, data);
        ret = 0;
    }

    if(disks[d1].isOk){
        wrtblk(d2+1,b,data);
        ret = 0;
    }



    return ret;


}
int read_raid10(int blkn, uchar* data){
    int pair = blkn % getNumOfRaid10Pairs();
    int d1 = pair *2;
    int d2 = getRaid10Pair(d1);
    int b = blkn/getNumOfRaid10Pairs();
    //TODO funkcionalnost za naizmenicno citanje sa diskova

    if(b<0 || b>= raidInfo.numOfBlocksPerDisk) return -1;

    int ret = -1;
    if(disks[d1].isOk) {
        rdblk(d1 + 1, b, data);
        ret = 0;
    }

    if(disks[d1].isOk){
        rdblk(d2+1,b,data);
        ret = 0;
    }



    return ret;
}

