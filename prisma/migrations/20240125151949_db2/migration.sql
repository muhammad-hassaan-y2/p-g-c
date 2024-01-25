-- CreateTable
CREATE TABLE `block` (
    `id` VARCHAR(191) NOT NULL,
    `blockerId` VARCHAR(191) NOT NULL,
    `blockedId` VARCHAR(191) NOT NULL,

    INDEX `Block_blockedId_idx`(`blockedId`),
    INDEX `Block_blockerId_idx`(`blockerId`),
    UNIQUE INDEX `Block_blockerId_blockedId_key`(`blockerId`, `blockedId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `follow` (
    `id` VARCHAR(191) NOT NULL,
    `followerId` VARCHAR(191) NOT NULL,
    `followingId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Follow_followerId_idx`(`followerId`),
    INDEX `Follow_followingId_idx`(`followingId`),
    UNIQUE INDEX `Follow_followerId_followingId_key`(`followerId`, `followingId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stream` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `thumbnailUrl` VARCHAR(255) NULL,
    `ingressId` VARCHAR(191) NULL,
    `serverUrl` VARCHAR(255) NULL,
    `streamKey` VARCHAR(255) NULL,
    `isLive` BOOLEAN NOT NULL DEFAULT false,
    `isChatEnabled` BOOLEAN NOT NULL DEFAULT true,
    `isChatDelayed` BOOLEAN NOT NULL DEFAULT false,
    `isChatFollowersOnly` BOOLEAN NOT NULL DEFAULT false,
    `userId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Stream_ingressId_key`(`ingressId`),
    UNIQUE INDEX `Stream_userId_key`(`userId`),
    INDEX `Stream_ingressId_idx`(`ingressId`),
    INDEX `Stream_name_idx`(`name`(191)),
    INDEX `Stream_userId_idx`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `imageUrl` VARCHAR(255) NOT NULL,
    `externalUserId` VARCHAR(191) NOT NULL,
    `bio` VARCHAR(255) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_username_key`(`username`),
    UNIQUE INDEX `User_externalUserId_key`(`externalUserId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
