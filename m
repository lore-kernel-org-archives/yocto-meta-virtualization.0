Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.4778.1631830812954249900
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 15:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qb5OwNjE;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id m9so7072275qtk.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 15:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PZIyTxkspJhUn9nbHyhvTjDS2M8w/HBvNm4YUnvQr68=;
        b=qb5OwNjE+9q+Kg9le5IXeyW/xyAqOaRoW66W9S63JZvl2Yxz70ekjMt+ZIgoRDO9pH
         QI1tWvwygx4tPZrSeBfTI9yi30ndR8XBP1hfIUqdM1wPW5QO7ni5YCDOVEbRRRqEsFDY
         w7Vgy3tgxkVMIapSkhqoE0KKKRMDPqkdPuFE4vwY3cNRgWBtnJ8PUWEM3Hxn3/ULuDJe
         zf0oJ3Rs4+1DbQqmRpr4th4o6pFUeX+Hz+E6AZV1PB+j36XYfSQbqco22nwNXtFDOcp6
         rz5GyEpqJSmhULtHEiv+zkTGFkq/yBAVu/AUdnG1/TxlwdI/83AAldw5+PHveDupEn1v
         mt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PZIyTxkspJhUn9nbHyhvTjDS2M8w/HBvNm4YUnvQr68=;
        b=2Nf/mVQ0yU6TKF6C+G56LUgYUISd1e6RloQG3X3INh3pYcEZttNb46D19ICbLj49xm
         WXhem2Up695eHhFMbamJu5kODrbuLW4C80OFS+VFguy2/MXlv8QJ61Go7cNjnkv/tv+W
         Mv6xDw34HhiVTIFJwX6EwBioeNn2QEEbzNnsqQlRr7HsxrgMLuj18slDczXa77QPAQTd
         3MmaGHucHzxLKlLlvoRCVFkMyK3fDbWJqpG9wo7ZeiWC0YAUWNULr15OTXYtSsLLxaUL
         JQcsRci/bvT2Qp3Chwo1E8Mx9Jbv/NBsZ88L7h/OnFTpcmyVd2XbQw8AszsbHd7mMhqL
         lWgA==
X-Gm-Message-State: AOAM531oLLidu5bj1wtOM1D3qp+1irD1X8p/VH22qn7CT8ami4F2f2F0
	cmX26z0azFwK/Mm01/JbWfXXiZSYmI6jSg==
X-Google-Smtp-Source: ABdhPJysQI/hC/lvJnqIR0KD9jtVDeT42oHmVc6cysi7F54QcSLOcNVuVZzNzpDkKvsQMSKgPH4hEQ==
X-Received: by 2002:ac8:574e:: with SMTP id 14mr7515231qtx.43.1631830812058;
        Thu, 16 Sep 2021 15:20:12 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id w19sm3541306qki.21.2021.09.16.15.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:20:11 -0700 (PDT)
Date: Thu, 16 Sep 2021 18:20:10 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sana kazi <sanakazisk19@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master-next][PATCH] lxc: Fix -c command for lxc-attach
Message-ID: <20210916222009.GE25504@gmail.com>
References: <20210916050653.23238-1-sanakazisk19@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210916050653.23238-1-sanakazisk19@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][master-next][PATCH] lxc: Fix -c command for lxc-attach
on 16/09/2021 sana kazi wrote:

> Added fix_c_command.patch the -c command seems to be broken because
> the passed context is ignored and always overwritten by the context
> specified in the config file.
> 
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  .../lxc/files/fix_c_command.patch             | 36 +++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/fix_c_command.patch
> 
> diff --git a/recipes-containers/lxc/files/fix_c_command.patch b/recipes-containers/lxc/files/fix_c_command.patch
> new file mode 100644
> index 0000000..1ed8daf
> --- /dev/null
> +++ b/recipes-containers/lxc/files/fix_c_command.patch
> @@ -0,0 +1,36 @@
> +From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001
> +From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> +Date: Mon, 23 Aug 2021 15:39:28 +0200
> +Subject: [PATCH] attach: Fix -c command
> +
> +Currently, the -c command (to set the selinux context) seems to be
> +broken because the passed context is ignored and always overwritten by
> +the context specified in the config file. The intention behind the -c
> +imho was to be able to manually overwrite this behavior. This patch
> +ensures that the selinux context will be set if passed via the command
> +line.
> +
> +Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> +---
> + src/lxc/tools/lxc_attach.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +Upstream-Status: Backport [https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1bcfa1f65.patch]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c
> +index 0374d980b4..e6b388b20c 100644
> +--- a/src/lxc/tools/lxc_attach.c
> ++++ b/src/lxc/tools/lxc_attach.c
> +@@ -379,7 +379,10 @@ int main(int argc, char *argv[])
> + 		attach_options.gid = my_args.gid;
> + 
> + 	// selinux_context will be NULL if not set
> +-	attach_options.lsm_label = selinux_context;
> ++	if (selinux_context) {
> ++		attach_options.attach_flags |= LXC_ATTACH_LSM_LABEL;
> ++		attach_options.lsm_label = selinux_context;
> ++	}
> + 
> + 	if (command.program) {
> + 		ret = c->attach_run_wait(c, &attach_options, command.program,
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index 3215928..f5b5128 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -50,6 +50,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0 \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>          file://enable_seccomp_profile_when_compiled_libseccomp.patch \
> +        file://fix_c_command.patch \
>  	"
>  
>  SRCREV = "cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874"
> -- 
> 2.17.1
> 

> 
> 
> 

