#include "kernel/types.h"
#include "kernel/fs.h"

#include "user/user.h"

#define SIZE_OF_DISK_MB 128UL
#define SIZE_OF_DISK_BYTES (SIZE_OF_DISK_MB * 1024UL * 1024UL)
#define NUM_OF_BLOCKS_PER_DISK (SIZE_OF_DISK_BYTES / BSIZE - 1)
#define CONFIGURATION_BLOCK_LOCATION NUM_OF_BLOCKS_PER_DISK-1 //location of a last block

static struct RAID{
    enum RAID_TYPE raidType;
    uint numOfBlocksPerDisk;
    uint numOfDisks;
    uint sizeOfBlock;
    uint isInitialized;


} raidInfo;

static struct DISK{
    char isOk;
    char blockInitialized[NUM_OF_BLOCKS_PER_DISK];
} disks[DISKS];

typedef struct Desc{
    struct RAID raidInfo;
    struct DISK disk;
} DiskDesc;

//static int parityDiskBlockInitialized[NUM_OF_BLOCKS_PER_DISK];

//INDEKSIRANJE RAID DISKOVA POCINJE OD 1 !!!!!!!!!!!!!!!!!!!!!!


int write_raid0(int blkn, uchar* data);
int read_raid0(int blkn, uchar* data);

int write_raid1(int blkn, uchar* data);
int read_raid1(int blkn, uchar* data);

int write_raid10(int blkn, uchar* data);
int read_raid10(int blkn, uchar* data);

int write_raid4(int blkn, uchar* data);
int read_raid4(int blkn, uchar* data);

int write_raid5(int blkn, uchar* data);
int read_raid5(int blkn, uchar* data);

void updateConfig(){
	uchar configBlock[BSIZE];

	memcpy(configBlock, &raidInfo, sizeof(struct RAID));
	for (int i = 1; i <= DISKS; i++) {
		wrtblk(i,CONFIGURATION_BLOCK_LOCATION,configBlock);
	}
}

void pullConfig(){

	uchar configBlock[BSIZE];
	rdblk(1,CONFIGURATION_BLOCK_LOCATION,configBlock);
	memcpy(&raidInfo, configBlock, sizeof(struct RAID));

}


int init_raid(enum RAID_TYPE raid){
    raidInfo.raidType = raid;
    raidInfo.numOfDisks = DISKS; //promeniti sa promenom broja diskova
    raidInfo.sizeOfBlock = BSIZE;
    raidInfo.numOfBlocksPerDisk = NUM_OF_BLOCKS_PER_DISK;
    raidInfo.isInitialized = 1;

    for(int i = 0; i < DISKS; i++){
        disks[i].isOk = 1;
    }

	updateConfig();


    //printf("%d %d %d\n",sizeof(raidInfo),sizeof(disks[0]), (sizeof(raidInfo)+sizeof(disks[0]))/BSIZE);


//    int raidDataSizeInBlocks = (sizeof(raidInfo)+sizeof(disks[0]))/BSIZE+1;
//
//
//    for(int i = 0; i < raidInfo.numOfDisks;i++){
//        DiskDesc desc;
//        desc.raidInfo = raidInfo;
//        desc.disk = disks[i];
//        printf("%d\n",sizeof(desc));
//    }




    //RAID4 initialization


//    for(int i = 0;i < raidInfo.numOfBlocksPerDisk; i++)
//        parityDiskBlockInitialized[i] = 0;



    return 0;
}

int destroy_raid(){
    raidInfo.isInitialized = 0;
	updateConfig();
    return 0;
}

int info_raid(uint *blkn, uint *blks, uint *diskn){
	if(!raidInfo.isInitialized) pullConfig();

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
	if(raidInfo.isInitialized==0) pullConfig();
    if(raidInfo.isInitialized==0) return -1;

    switch(raidInfo.raidType){
        case RAID0:
            return write_raid0(blkn,data);
        case RAID1:
            return write_raid1(blkn,data);
        case RAID0_1:
            return write_raid10(blkn,data);
        case RAID4:
            return write_raid4(blkn,data);
        case RAID5:
            return write_raid5(blkn,data);

        default:


    }

    return -1;
}

int read_raid(int blkn, uchar* data){
	if(raidInfo.isInitialized==0) pullConfig();
    if(raidInfo.isInitialized==0) return -1;

    switch(raidInfo.raidType){
        case RAID0:
            return read_raid0(blkn,data);
        case RAID1:
            return read_raid1(blkn,data);
        case RAID0_1:
            return read_raid10(blkn,data);
        case RAID4:
            return read_raid4(blkn,data);
        case RAID5:
            return read_raid5(blkn, data);
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
int read_raid10(int blkn, uchar* data) {
    int pair = blkn % getNumOfRaid10Pairs();
    int d1 = pair * 2;
    int d2 = getRaid10Pair(d1);
    int b = blkn / getNumOfRaid10Pairs();
    //TODO funkcionalnost za naizmenicno citanje sa diskova

    if (b < 0 || b >= raidInfo.numOfBlocksPerDisk) return -1;

    int ret = -1;
    if (disks[d1].isOk) {
        rdblk(d1 + 1, b, data);
        ret = 0;
    }

    if (disks[d1].isOk) {
        rdblk(d2 + 1, b, data);
        ret = 0;
    }


    return ret;
}

int write_data_raid4_raid5(int parityDisk,int d, int b,uchar* data){
    uchar temp[1024];
    uchar* parityBlock = temp;

    uchar oldBlock[1024];

    rdblk(parityDisk+1,b, parityBlock);
    rdblk(d+1,b,oldBlock);


    if(!disks[parityDisk].blockInitialized[b]) {
        parityBlock = data;
        disks[parityDisk].blockInitialized[b]=1;
    }
    else{
        for(int i = 0; i < raidInfo.sizeOfBlock; i++){
            parityBlock[i] ^= data[i]^(disks[d].blockInitialized[b]?oldBlock[i]:0);
        }
    }


    disks[d].blockInitialized[b]=1;

    wrtblk(d+1,b,data);
    wrtblk(parityDisk+1,b,parityBlock);
    return 0;
}
int write_raid4(int blkn, uchar* data){
    //parity even
    int numOfUsableDisks = raidInfo.numOfDisks-1; //jedan disk se koristi za parity

    int d = blkn%numOfUsableDisks;
    int b = blkn/numOfUsableDisks;

    int parityDisk=raidInfo.numOfDisks-1;

    if(b<0 || b>=raidInfo.numOfBlocksPerDisk) return -1;

   // printf("blkn: %d d: %d b: %d\n",blkn,d,b);


   return write_data_raid4_raid5(parityDisk,d,b,data);

}
int restore_data(int faultyDisk, int blk, uchar* data){



    uchar diskBlock[DISKS][BSIZE];  //TODO PREPRAVI DA NE KORISTIS NJIHOVE MAKROE

    for(int i = 0; i < raidInfo.sizeOfBlock; i++)
        data[i] = 0;

    for(int i = 1; i<=raidInfo.numOfDisks;i++){
        if(i==faultyDisk+1) continue;
        if(!disks[i-1].isOk) return -1;

        rdblk(i,blk,diskBlock[i-1]);
    }

    for(int i = 0; i<raidInfo.sizeOfBlock; i++){
        for(int j = 1; j<=raidInfo.numOfDisks;j++){
            if(j == faultyDisk+1){
              //  printf("_ ");
                continue;
            }
            data[i] ^= diskBlock[j-1][i];

            //printf("%d ",diskBlock[j-1][i]);

        }

        //printf("recovered: %d\n",data[i]);
    }

    return 0;

}

int read_raid4(int blkn, uchar* data){
    //parity even
    int numOfUsableDisks = raidInfo.numOfDisks-1; //jedan disk se koristi za parity

    int d = blkn%numOfUsableDisks;
    int b = blkn/numOfUsableDisks;

    if(b<0 || b>=raidInfo.numOfBlocksPerDisk) return -1;

    if(!disks[d].isOk){
        //printf("Restore data\n");
        return restore_data(d,b,data);
    }

    rdblk(d+1,b,data);



    return 0;
}

int getParityDiskRaid5(int blkn){
    int b = blkn/(raidInfo.numOfDisks-1);
    return b%raidInfo.numOfDisks;
}

int write_raid5(int blkn, uchar* data){

    int b = blkn/(raidInfo.numOfDisks-1);
    int d = blkn%(raidInfo.numOfDisks-1);

    int parityDisk= getParityDiskRaid5(blkn);

    if(d >= parityDisk) {
        d++;
    }

    if(b < 0 || b>= raidInfo.numOfBlocksPerDisk) return -1;

    //printf("blkn: %d b:%d pd:%d d:%d\n",blkn,b,parityDisk,d);


    return write_data_raid4_raid5(parityDisk,d,b,data);
}
int read_raid5(int blkn, uchar* data){

    int b = blkn/(raidInfo.numOfDisks-1);
    int d = blkn%(raidInfo.numOfDisks-1);

    int parityDisk= getParityDiskRaid5(blkn);

    if(d >= parityDisk) {
        d++;
    }

    if(b < 0 || b>= raidInfo.numOfBlocksPerDisk) return -1;

    if(!disks[d].isOk){
        //printf("Restore data\n");
        return restore_data(d,b,data);
    }

    rdblk(d+1,b,data);



    return 0;
}
