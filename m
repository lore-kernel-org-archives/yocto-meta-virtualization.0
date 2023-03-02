Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB94AC678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 21:29:31 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.7088.1677792561849660980
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 13:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k3SoxEGI;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id r5so843748qtp.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 13:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/cAumnukP3bAJIvwOrTDrsFieaQ1vX6xOG6YBhYnJk=;
        b=k3SoxEGI9x6r2Gqy8Y0nxNEjtqaLNXNBhBOGURdtPoTqgs7yq3N5ooZ0lEkZrhpR1U
         hSZ8TuAHUtoXDhxO/Kdv9h8Tg5/lUlIFfz3VC8L7O4PEiVFXSxTkNc6bdrXKbpk/M7KL
         vc7/YpJMrZ8k9qMmqjv03pGZ5GQ9wm2WiliZ99V00jdHh3IE+LNB5EfQYRVPTxnzsJWv
         IadxZA9OGS77jCvMGlUoJ3FQ2qwBlFa8BRds6HYMi7hbleiIY5iT/NpkFdypBo+LvwgT
         MDKu4isPEHPIUhzMowqj1Gb4IOC9iLKSmEnMIHom4qEkICZr7QURsg3C8u8gZI78kNqy
         9n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/cAumnukP3bAJIvwOrTDrsFieaQ1vX6xOG6YBhYnJk=;
        b=Y1meS/8Fz8k8+1e5pn6fP1ErxfK19ayL9jHA7K+SJ8vfjiG2ma9yGVMGv/mu67DfqY
         fUPmDVs/z8nP6gSfKVOgq2ct/DF5elHrSppUT7TjVW+zVHyj6i1CRlvFTN6eVym96hgU
         YshccHVb8BiHcQHazJnWwncKFM4OTUOfza20MB2F8Rq5VUJKqkGZM1mZJyss4XveFd9A
         8oaTjciDkGhCLDQzhc4CJ8oC1m9xqDGkGWPGEemFtPMcXqUO8kJT/lKimTkAXzcrOnd+
         C5fpLI1YcHe7+mPHyHJvb5rDEYaMjEb/pkPwPmPVQ0WSq1pfJI6HaiPOtVqMtTy/zamp
         oBjw==
X-Gm-Message-State: AO0yUKWvXi86kaLx/vbGIFplhipDKLgXVe7hODfquV8u89uICpa8lPfa
	p0eYQmPMbx5eqO1V9cAcFgzjnAKhMouQhA==
X-Google-Smtp-Source: AK7set+z6wF+iWBlb2qU7M+FGCyq7fQoB3KGzpl4iMw9p6QMIR4Jf0v1vYr4WLa3EwEBAw18P0yFtA==
X-Received: by 2002:ac8:5ad5:0:b0:3bf:c432:357 with SMTP id d21-20020ac85ad5000000b003bfc4320357mr21919257qtd.10.1677792560756;
        Thu, 02 Mar 2023 13:29:20 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x14-20020ac86b4e000000b003bfeb30c24dsm441789qts.39.2023.03.02.13.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:28:13 -0800 (PST)
Date: Thu, 2 Mar 2023 16:27:16 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 07/10] skopeo: use
 container-host bbclass to provide configuration
Message-ID: <ZAEUtI35gVEGDGMi@gmail.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
 <20230301095228.122562-7-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301095228.122562-7-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 21:29:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7926

These are arguably new functionality, so shouldn't be backported.

But they are quite simple and make the series much simpler to apply, so I ended up taking the change.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 07/10] skopeo: use container-host bbclass to provide configuration
on 01/03/2023 Chen Qi wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Instead of providing storage and registries configuration files
> in this package, we inherit container-host which will provide a
> common definition of these configs.
> 
> This allows multiple packages to ensure that the configuration
> files are present, and not conflict in their installation.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../skopeo/files/registries.conf              |  25 ---
>  recipes-containers/skopeo/files/storage.conf  | 195 ------------------
>  recipes-containers/skopeo/skopeo_git.bb       |   7 +-
>  3 files changed, 2 insertions(+), 225 deletions(-)
>  delete mode 100644 recipes-containers/skopeo/files/registries.conf
>  delete mode 100644 recipes-containers/skopeo/files/storage.conf
> 
> diff --git a/recipes-containers/skopeo/files/registries.conf b/recipes-containers/skopeo/files/registries.conf
> deleted file mode 100644
> index ba6c3f6..0000000
> --- a/recipes-containers/skopeo/files/registries.conf
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -# This is a system-wide configuration file used to
> -# keep track of registries for various container backends.
> -# It adheres to TOML format and does not support recursive
> -# lists of registries.
> -
> -# The default location for this configuration file is /etc/containers/registries.conf.
> -
> -# The only valid categories are: 'registries.search', 'registries.insecure', 
> -# and 'registries.block'.
> -
> -[registries.search]
> -registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com', 'registry.centos.org']
> -
> -# If you need to access insecure registries, add the registry's fully-qualified name.
> -# An insecure registry is one that does not have a valid SSL certificate or only does HTTP.
> -[registries.insecure]
> -registries = []
> -
> -
> -# If you need to block pull access from a registry, uncomment the section below
> -# and add the registries fully-qualified name.
> -#
> -# Docker only
> -[registries.block]
> -registries = []
> diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
> deleted file mode 100644
> index 722750c..0000000
> --- a/recipes-containers/skopeo/files/storage.conf
> +++ /dev/null
> @@ -1,195 +0,0 @@
> -# This file is is the configuration file for all tools
> -# that use the containers/storage library.
> -# See man 5 containers-storage.conf for more information
> -# The "container storage" table contains all of the server options.
> -[storage]
> -
> -# Default Storage Driver, Must be set for proper operation.
> -driver = "overlay"
> -
> -# Temporary storage location
> -runroot = "/run/containers/storage"
> -
> -# Primary Read/Write location of container storage
> -graphroot = "/var/lib/containers/storage"
> -
> -# Storage path for rootless users
> -#
> -# rootless_storage_path = "$HOME/.local/share/containers/storage"
> -
> -[storage.options]
> -# Storage options to be passed to underlying storage drivers
> -
> -# AdditionalImageStores is used to pass paths to additional Read/Only image stores
> -# Must be comma separated list.
> -additionalimagestores = [
> -]
> -
> -# Remap-UIDs/GIDs is the mapping from UIDs/GIDs as they should appear inside of
> -# a container, to the UIDs/GIDs as they should appear outside of the container,
> -# and the length of the range of UIDs/GIDs.  Additional mapped sets can be
> -# listed and will be heeded by libraries, but there are limits to the number of
> -# mappings which the kernel will allow when you later attempt to run a
> -# container.
> -#
> -# remap-uids = 0:1668442479:65536
> -# remap-gids = 0:1668442479:65536
> -
> -# Remap-User/Group is a user name which can be used to look up one or more UID/GID
> -# ranges in the /etc/subuid or /etc/subgid file.  Mappings are set up starting
> -# with an in-container ID of 0 and then a host-level ID taken from the lowest
> -# range that matches the specified name, and using the length of that range.
> -# Additional ranges are then assigned, using the ranges which specify the
> -# lowest host-level IDs first, to the lowest not-yet-mapped in-container ID,
> -# until all of the entries have been used for maps.
> -#
> -# remap-user = "containers"
> -# remap-group = "containers"
> -
> -# Root-auto-userns-user is a user name which can be used to look up one or more UID/GID
> -# ranges in the /etc/subuid and /etc/subgid file.  These ranges will be partitioned
> -# to containers configured to create automatically a user namespace.  Containers
> -# configured to automatically create a user namespace can still overlap with containers
> -# having an explicit mapping set.
> -# This setting is ignored when running as rootless.
> -# root-auto-userns-user = "storage"
> -#
> -# Auto-userns-min-size is the minimum size for a user namespace created automatically.
> -# auto-userns-min-size=1024
> -#
> -# Auto-userns-max-size is the minimum size for a user namespace created automatically.
> -# auto-userns-max-size=65536
> -
> -[storage.options.overlay]
> -# ignore_chown_errors can be set to allow a non privileged user running with
> -# a single UID within a user namespace to run containers. The user can pull
> -# and use any image even those with multiple uids.  Note multiple UIDs will be
> -# squashed down to the default uid in the container.  These images will have no
> -# separation between the users in the container. Only supported for the overlay
> -# and vfs drivers.
> -#ignore_chown_errors = "false"
> -
> -# Inodes is used to set a maximum inodes of the container image.
> -# inodes = ""
> -
> -# Path to an helper program to use for mounting the file system instead of mounting it
> -# directly.
> -#mount_program = "/usr/bin/fuse-overlayfs"
> -
> -# mountopt specifies comma separated list of extra mount options
> -mountopt = "nodev"
> -
> -# Set to skip a PRIVATE bind mount on the storage home directory.
> -# skip_mount_home = "false"
> -
> -# Size is used to set a maximum size of the container image.
> -# size = ""
> -
> -# ForceMask specifies the permissions mask that is used for new files and
> -# directories.
> -#
> -# The values "shared" and "private" are accepted.
> -# Octal permission masks are also accepted.
> -#
> -#  "": No value specified.
> -#     All files/directories, get set with the permissions identified within the
> -#     image.
> -#  "private": it is equivalent to 0700.
> -#     All files/directories get set with 0700 permissions.  The owner has rwx
> -#     access to the files. No other users on the system can access the files.
> -#     This setting could be used with networked based homedirs.
> -#  "shared": it is equivalent to 0755.
> -#     The owner has rwx access to the files and everyone else can read, access
> -#     and execute them. This setting is useful for sharing containers storage
> -#     with other users.  For instance have a storage owned by root but shared
> -#     to rootless users as an additional store.
> -#     NOTE:  All files within the image are made readable and executable by any
> -#     user on the system. Even /etc/shadow within your image is now readable by
> -#     any user.
> -#
> -#   OCTAL: Users can experiment with other OCTAL Permissions.
> -#
> -#  Note: The force_mask Flag is an experimental feature, it could change in the
> -#  future.  When "force_mask" is set the original permission mask is stored in
> -#  the "user.containers.override_stat" xattr and the "mount_program" option must
> -#  be specified. Mount programs like "/usr/bin/fuse-overlayfs" present the
> -#  extended attribute permissions to processes within containers rather then the
> -#  "force_mask"  permissions.
> -#
> -# force_mask = ""
> -
> -[storage.options.thinpool]
> -# Storage Options for thinpool
> -
> -# autoextend_percent determines the amount by which pool needs to be
> -# grown. This is specified in terms of % of pool size. So a value of 20 means
> -# that when threshold is hit, pool will be grown by 20% of existing
> -# pool size.
> -# autoextend_percent = "20"
> -
> -# autoextend_threshold determines the pool extension threshold in terms
> -# of percentage of pool size. For example, if threshold is 60, that means when
> -# pool is 60% full, threshold has been hit.
> -# autoextend_threshold = "80"
> -
> -# basesize specifies the size to use when creating the base device, which
> -# limits the size of images and containers.
> -# basesize = "10G"
> -
> -# blocksize specifies a custom blocksize to use for the thin pool.
> -# blocksize="64k"
> -
> -# directlvm_device specifies a custom block storage device to use for the
> -# thin pool. Required if you setup devicemapper.
> -# directlvm_device = ""
> -
> -# directlvm_device_force wipes device even if device already has a filesystem.
> -# directlvm_device_force = "True"
> -
> -# fs specifies the filesystem type to use for the base device.
> -# fs="xfs"
> -
> -# log_level sets the log level of devicemapper.
> -# 0: LogLevelSuppress 0 (Default)
> -# 2: LogLevelFatal
> -# 3: LogLevelErr
> -# 4: LogLevelWarn
> -# 5: LogLevelNotice
> -# 6: LogLevelInfo
> -# 7: LogLevelDebug
> -# log_level = "7"
> -
> -# min_free_space specifies the min free space percent in a thin pool require for
> -# new device creation to succeed. Valid values are from 0% - 99%.
> -# Value 0% disables
> -# min_free_space = "10%"
> -
> -# mkfsarg specifies extra mkfs arguments to be used when creating the base
> -# device.
> -# mkfsarg = ""
> -
> -# metadata_size is used to set the `pvcreate --metadatasize` options when
> -# creating thin devices. Default is 128k
> -# metadata_size = ""
> -
> -# Size is used to set a maximum size of the container image.
> -# size = ""
> -
> -# use_deferred_removal marks devicemapper block device for deferred removal.
> -# If the thinpool is in use when the driver attempts to remove it, the driver
> -# tells the kernel to remove it as soon as possible. Note this does not free
> -# up the disk space, use deferred deletion to fully remove the thinpool.
> -# use_deferred_removal = "True"
> -
> -# use_deferred_deletion marks thinpool device for deferred deletion.
> -# If the device is busy when the driver attempts to delete it, the driver
> -# will attempt to delete device every 30 seconds until successful.
> -# If the program using the driver exits, the driver will continue attempting
> -# to cleanup the next time the driver is used. Deferred deletion permanently
> -# deletes the device and all data stored in device will be lost.
> -# use_deferred_deletion = "True"
> -
> -# xfs_nospace_max_retries specifies the maximum number of retries XFS should
> -# attempt to complete IO when ENOSPC (no space) error is returned by
> -# underlying storage device.
> -# xfs_nospace_max_retries = "0"
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index d32c525..12a24b0 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -22,8 +22,6 @@ RDEPENDS:${PN} = " \
>  SRC_URI = " \
>      git://github.com/containers/skopeo;branch=main;protocol=https \
>      file://0001-Makefile-use-pkg-config-instead-of-gpgme-config.patch \
> -    file://storage.conf \
> -    file://registries.conf \
>  "
>  
>  SRCREV = "3e2defd6d37b742adde2aac6cb01f6c3c17da8e2"
> @@ -35,6 +33,8 @@ S = "${WORKDIR}/git"
>  inherit goarch
>  inherit pkgconfig
>  
> +inherit container-host
> +
>  # This CVE was fixed in the container image go library skopeo is using.
>  # See:
>  # https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214
> @@ -81,9 +81,6 @@ do_install() {
>  
>  	install ${S}/src/import/bin/skopeo ${D}/${sbindir}/
>  	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
> -
> -	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
> -	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
>  }
>  
>  do_install:append:class-native() {
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7917): https://lists.yoctoproject.org/g/meta-virtualization/message/7917
> Mute This Topic: https://lists.yoctoproject.org/mt/97311053/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


