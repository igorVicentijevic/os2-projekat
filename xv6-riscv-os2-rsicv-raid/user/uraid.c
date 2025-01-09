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

int write_raid0(int blkn, uchar* data);
int read_raid0(int blkn, uchar* data);


int init_raid(enum RAID_TYPE raid){
    raidInfo.raidType = raid;
    raidInfo.numOfDisks = DISKS; //promeniti sa promenom broja diskova
    raidInfo.sizeOfBlock = BSIZE;
    raidInfo.numOfBlocksPerDisk = (SIZE_OF_DISK_MB * 1000000)/BSIZE;
    raidInfo.isInitialized = 1;

//    for(int i = 0; i < raidInfo.numOfDisks; i++){
//        char name[100];
//        name[0] = '0' + i;
//        printf("\n init disk %d %s\n", i, name);
//        vdinit(i, name);
//    }
    return 0;
}

int info_raid(uint *blkn, uint *blks, uint *diskn){
    *blkn = raidInfo.numOfBlocksPerDisk;
    *blks = raidInfo.sizeOfBlock;
    *diskn = raidInfo.numOfDisks;
    return 0;
}

int write_raid(int blkn, uchar* data){

    if(raidInfo.isInitialized==0) return -1;

    switch(raidInfo.raidType){
        case RAID0:
            return write_raid0(blkn,data);
        default:


    }

    return -1;
}

int read_raid(int blkn, uchar* data){
    if(raidInfo.isInitialized==0) return -1;

    switch(raidInfo.raidType){
        case RAID0:
            return read_raid0(blkn,data);
        default:
    }

    return 0;
}

int write_raid0(int blkn, uchar* data){
    int d = blkn% raidInfo.numOfDisks + 1;
    int b = blkn / raidInfo.numOfDisks;


    if(b >= raidInfo.numOfBlocksPerDisk) return -2;

    wrtblk(d,b,data);
    return 0;
}

int read_raid0(int blkn, uchar* data){
    int d = blkn% raidInfo.numOfDisks+1;
    int b = blkn / raidInfo.numOfDisks;

    if(b >= raidInfo.numOfBlocksPerDisk) return -2;

    rdblk(d,b,data);
    return 0;
}
