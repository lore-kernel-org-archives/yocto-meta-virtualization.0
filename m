Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12ECFC4828F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:17:02 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.16293.1706797017552523914
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 06:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vq8yNDfa;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e271dcd738so415691a34.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706797017; x=1707401817; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHttaSidsiaT+ipzHZzQBHdDpF6Wh6lOu73lZurHNqA=;
        b=Vq8yNDfam2cvpsjXY27bZ2FWVk8gEVhA2JcZYr7kYsSE6n6YAgcQgEehhmmalKsbAG
         vcrx1IEQVMFl61v2iVUbiM4duTWs5nXF1IZqlqQo+JKbgj7vryf4RrqU2A8dGlKBajqD
         9/PunHIkqcaLP8vngvrh1RvVBnYpRTyGhqcKeiVVBc7/sM+eiHBDhyJTlEQOYQnhgQFB
         6gZ0wcJrd1n2NIBHUPbwrDfIQh6CXuAPt+4wu0KET4w/gMsUKOoi7BMMDJNEsMwwJ0fN
         D1Ynb7io6dg1gO5VyXP/Mas6eOdFNskYD19sdd2+WJ4iNfwvaXN2eGTxPTiS4yUO//Bv
         yvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797017; x=1707401817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHttaSidsiaT+ipzHZzQBHdDpF6Wh6lOu73lZurHNqA=;
        b=H8bmxigaysBURT/3gchRT7k+S7TzbLTeAAa6P63B+TxxSalTbd6/AOOFzGY9i9fRS1
         z9fv2Nk6uOw0h5SiixnNq+A/+5+N4UMilNEd2rNs9N0/EmTY3a4asSa6gK6wor2Ci7aC
         OhZNXzyXSyXhs2e220YILMWjQEJ6WpAJIXt3Q8grPm96D4+EChWoBbU7SU3FyhCpI8/L
         6FTtRPDr5qgbj1r/Q0O2leIoAGdhNhvIfXTCEW87d4Ke3wiSbHdRe8ozg6/6B6H8R2g9
         MI6o4m7J3tTWa2BLvK1Wpp+c40a+rStU7XeVm4dMeOi+lp67i6TB1v98KYFIAtAYW/MI
         H/qw==
X-Gm-Message-State: AOJu0YyBsvJLfDSXRtJNlDuCDTZ450j9CqMcQ++/mRFQRP3P3Dqk9kRR
	Vj+FS0BQzUhwR5NC46ARbu4tT/tHdvhsRFXVSdzlsaRurCdPke2l
X-Google-Smtp-Source: AGHT+IG3VFJcuER/QQwWljxJSHvu9YJb1BOYQwZXsDasKM6F1LtmlegQqKBNJxOfR4F9TJHxJBV5ww==
X-Received: by 2002:a9d:6a02:0:b0:6e1:1014:153c with SMTP id g2-20020a9d6a02000000b006e11014153cmr2352462otn.20.1706797016642;
        Thu, 01 Feb 2024 06:16:56 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 12-20020ad45b8c000000b0068c501d0766sm3999684qvp.41.2024.02.01.06.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:16:56 -0800 (PST)
Date: Thu, 1 Feb 2024 14:16:54 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] container-host-config:storage.conf:
 sync with libpod v4.8.2
Message-ID: <Zbun1rrQvn8Wi7Df@gmail.com>
References: <20240129174132.24445-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129174132.24445-1-liu.ming50@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Feb 2024 14:17:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8559

In message: [meta-virtualization][PATCH] container-host-config:storage.conf: sync with libpod v4.8.2
on 29/01/2024 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> The current storage.conf is based on v1.33.0 of:
> https://github.com/containers/storage.git
> 
> while in podman v4.8.2, it has been upgraded to
> v1.50.3-0.20231005112617-44418abb2d89 of:
> https://github.com/containers/storage.git
> 
> let's sync it with podman v4.8.2.
> 
> which comprises the following commits in storage.conf:
> 
> ```
> 42d1d9637 Run codespell on code
> 91da0c2be add documentation on imagestore and add a warning if set
> 01fccaa58 options: enable Remap-User/Group setting
> e125790e9 Fix typo in storage.conf
> 57582350c Document transient_store in man page
> 522b67c94 Add new storage.conf option "transient_store"
> 5e9e2ba6b Revert incorrect "heeded" -> "needed" typo fix
> cffa19709 fix typos and spelling
> 268af0001 chunked: drop host dedup feature
> b64cfb4f4 Document the pull_options
> 17fccdc2d Clearup inheritance rules for storage.conf
> 3c76f174d Tell users who change graphroot location to fix the SELinux labels
> ```

While we don't have to keep this in sync directly with the
projects .. we haven't made any of our own changes to it yet,
so recynching it makes sense.

merged.

Bruce


> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  .../container-host-config/storage.conf        | 62 ++++++++++++++++---
>  1 file changed, 55 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes-containers/container-host-config/container-host-config/storage.conf b/recipes-containers/container-host-config/container-host-config/storage.conf
> index 722750c0..cb4525f2 100644
> --- a/recipes-containers/container-host-config/container-host-config/storage.conf
> +++ b/recipes-containers/container-host-config/container-host-config/storage.conf
> @@ -1,5 +1,14 @@
> -# This file is is the configuration file for all tools
> -# that use the containers/storage library.
> +# This file is the configuration file for all tools
> +# that use the containers/storage library. The storage.conf file
> +# overrides all other storage.conf files. Container engines using the
> +# container/storage library do not inherit fields from other storage.conf
> +# files.
> +#
> +#  Note: The storage.conf file overrides other storage.conf files based on this precedence:
> +#      /usr/containers/storage.conf
> +#      /etc/containers/storage.conf
> +#      $HOME/.config/containers/storage.conf
> +#      $XDG_CONFIG_HOME/containers/storage.conf (If XDG_CONFIG_HOME is set)
>  # See man 5 containers-storage.conf for more information
>  # The "container storage" table contains all of the server options.
>  [storage]
> @@ -11,12 +20,28 @@ driver = "overlay"
>  runroot = "/run/containers/storage"
>  
>  # Primary Read/Write location of container storage
> +# When changing the graphroot location on an SELINUX system, you must
> +# ensure  the labeling matches the default locations labels with the
> +# following commands:
> +# semanage fcontext -a -e /var/lib/containers/storage /NEWSTORAGEPATH
> +# restorecon -R -v /NEWSTORAGEPATH
>  graphroot = "/var/lib/containers/storage"
>  
> +# Optional alternate location of image store if a location separate from the
> +# container store is required. If set, it must be different than graphroot.
> +# imagestore = ""
> +
> +
>  # Storage path for rootless users
>  #
>  # rootless_storage_path = "$HOME/.local/share/containers/storage"
>  
> +# Transient store mode makes all container metadata be saved in temporary storage
> +# (i.e. runroot above). This is faster, but doesn't persist across reboots.
> +# Additional garbage collection must also be performed at boot-time, so this
> +# option should remain disabled in most configurations.
> +# transient_store = true
> +
>  [storage.options]
>  # Storage options to be passed to underlying storage drivers
>  
> @@ -25,6 +50,28 @@ graphroot = "/var/lib/containers/storage"
>  additionalimagestores = [
>  ]
>  
> +# Allows specification of how storage is populated when pulling images. This
> +# option can speed the pulling process of images compressed with format
> +# zstd:chunked. Containers/storage looks for files within images that are being
> +# pulled from a container registry that were previously pulled to the host.  It
> +# can copy or create a hard link to the existing file when it finds them,
> +# eliminating the need to pull them from the container registry. These options
> +# can deduplicate pulling of content, disk storage of content and can allow the
> +# kernel to use less memory when running containers.
> +
> +# containers/storage supports three keys
> +#   * enable_partial_images="true" | "false"
> +#     Tells containers/storage to look for files previously pulled in storage
> +#     rather then always pulling them from the container registry.
> +#   * use_hard_links = "false" | "true"
> +#     Tells containers/storage to use hard links rather then create new files in
> +#     the image, if an identical file already existed in storage.
> +#   * ostree_repos = ""
> +#     Tells containers/storage where an ostree repository exists that might have
> +#     previously pulled content which can be used when attempting to avoid
> +#     pulling content from the container registry
> +pull_options = {enable_partial_images = "false", use_hard_links = "false", ostree_repos=""}
> +
>  # Remap-UIDs/GIDs is the mapping from UIDs/GIDs as they should appear inside of
>  # a container, to the UIDs/GIDs as they should appear outside of the container,
>  # and the length of the range of UIDs/GIDs.  Additional mapped sets can be
> @@ -32,8 +79,8 @@ additionalimagestores = [
>  # mappings which the kernel will allow when you later attempt to run a
>  # container.
>  #
> -# remap-uids = 0:1668442479:65536
> -# remap-gids = 0:1668442479:65536
> +# remap-uids = "0:1668442479:65536"
> +# remap-gids = "0:1668442479:65536"
>  
>  # Remap-User/Group is a user name which can be used to look up one or more UID/GID
>  # ranges in the /etc/subuid or /etc/subgid file.  Mappings are set up starting
> @@ -41,7 +88,8 @@ additionalimagestores = [
>  # range that matches the specified name, and using the length of that range.
>  # Additional ranges are then assigned, using the ranges which specify the
>  # lowest host-level IDs first, to the lowest not-yet-mapped in-container ID,
> -# until all of the entries have been used for maps.
> +# until all of the entries have been used for maps. This setting overrides the
> +# Remap-UIDs/GIDs setting.
>  #
>  # remap-user = "containers"
>  # remap-group = "containers"
> @@ -57,7 +105,7 @@ additionalimagestores = [
>  # Auto-userns-min-size is the minimum size for a user namespace created automatically.
>  # auto-userns-min-size=1024
>  #
> -# Auto-userns-max-size is the minimum size for a user namespace created automatically.
> +# Auto-userns-max-size is the maximum size for a user namespace created automatically.
>  # auto-userns-max-size=65536
>  
>  [storage.options.overlay]
> @@ -113,7 +161,7 @@ mountopt = "nodev"
>  #  future.  When "force_mask" is set the original permission mask is stored in
>  #  the "user.containers.override_stat" xattr and the "mount_program" option must
>  #  be specified. Mount programs like "/usr/bin/fuse-overlayfs" present the
> -#  extended attribute permissions to processes within containers rather then the
> +#  extended attribute permissions to processes within containers rather than the
>  #  "force_mask"  permissions.
>  #
>  # force_mask = ""
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8556): https://lists.yoctoproject.org/g/meta-virtualization/message/8556
> Mute This Topic: https://lists.yoctoproject.org/mt/104036269/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


