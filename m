Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 056F7E00D8E; Wed, 18 Sep 2019 10:54:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  2.6 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.54 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 099E5E00C87
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:54:08 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id q1so1343602ion.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W31eDWSJYbqSQ6Whx+mm31FgzA0Q7i5dg0I9iDhBwnw=;
	b=RXLEtTuWwqv/uj8h1lmqn7HMffajxvhHVJ1hXtpwS5Hfexx8qofXXl0etXUNXPKmPy
	BqJiczA6fmmlOXG5HH2adzhSvJ8CikWB023PCPTc1JxlGmw8FMyJ5OaSwCnfR7Iq8tA8
	djVCCDPopTon16jq18lxcU1A6x+in8JPg7KC7A2K5QpJNcS6qk4R2aDo0rGzWfBZUHzP
	9owcMKCJpbDR93JXuf/AIZBtgJQPRN7r4w1ZmUI0zLHrPMAeAIYcPINuUlYLsFfn3Y1d
	h2ys3ahafvl4y336QCZw2lJm65RaD3jqDH9aCYoBviUSnns098cl65CJJ3G3ieYe78nt
	ktXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W31eDWSJYbqSQ6Whx+mm31FgzA0Q7i5dg0I9iDhBwnw=;
	b=imJOs/rvA7fEbFfgbRToHr89Sbt4DPP2b2ntWulII96EqRW9alaw1C5lIBQL4gRTKY
	ciXoZRE1P6qsk89+3OJFWeafhtPzvVil7lwSdhoUJV8SLxEhVIl8Xmj9yAeZn+hMMDV2
	jrdDUozDvOBrOBiCB4A2l3iadMwHIZy7D7c6vhW2tF/6xlnm/DqEhFDgOtNgkYI3FSO1
	08AGNYgFhgPIiVwkUrAWNoPoZiyUmdHV0BQD3vmcReIEdNjuGyjX/UeQkTmYVUUC6gJY
	DmPkVUGn6BjzAL5UgjRXBcOSHHgn6RZbypgex1F8v2seqJc2uactXSNpXiq1k6Ivzzz8
	gyMw==
X-Gm-Message-State: APjAAAWwAAATY+y/UQXgYUBLDMaPkfVJG5gRxlGPROQUm8KMgB4hXA1a
	BNwA1OOEGxp1wgJOMQcCbbkcBsZO6JZW+w==
X-Google-Smtp-Source: APXvYqwf5IN7GORGAHgMeCJ8EbEQfd6u2JFwnANAp3/R39cSuHXsbijIosMaaURDmXPRqqp9mXHItg==
X-Received: by 2002:a5d:9696:: with SMTP id m22mr6278123ion.14.1568829248227; 
	Wed, 18 Sep 2019 10:54:08 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	a26sm2155856iot.46.2019.09.18.10.54.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 10:54:07 -0700 (PDT)
Date: Wed, 18 Sep 2019 13:54:05 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20190918175402.GA22136@gmail.com>
References: <1568750311-566-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1568750311-566-1-git-send-email-mark.asselstine@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] oci-systemd-hook: fixup patch context
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2019 17:54:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

nerged.

Bruce

In message: [meta-virtualization][PATCH] oci-systemd-hook: fixup patch context
on 17/09/2019 Mark Asselstine wrote:

> commit 7394c154a92f [containers: update oci-systemd-hook to 0.2.0]
> incorrectly adjusted the context around the patch
> 0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch.
> 
> This resulted in containers failing with an error:
> systemdhook <error>: Failed to mkdir new dest: /opt/container/cube-server/rootfs/sys/fs/cgroup/perf_event: No such file or directory
> 
> Unfortunately, the code was being patched in ahead of the mounting of
> the tmpfs after the patch context was adjusted. You can even get a
> hint of this in the comment "Systemd is already handled above". Here
> we correct this by pushing the code down to the correct position in
> the file/function, making the error go away and proper function
> return.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...itional-cgroup-mounts-from-root-NS-automatica.patch | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch b/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch
> index b1299f5..34f0c09 100644
> --- a/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch
> +++ b/recipes-containers/oci-systemd-hook/oci-systemd-hook/0001-Add-additional-cgroup-mounts-from-root-NS-automatica.patch
> @@ -1,4 +1,4 @@
> -From f9c640fa1d4c14dfbd2bc40af91cb446ad373075 Mon Sep 17 00:00:00 2001
> +From 12d92162c449d51f4ffa482f7daaeb42c4135937 Mon Sep 17 00:00:00 2001
>  From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Tue, 2 Jul 2019 20:51:08 +0000
>  Subject: [PATCH] Add additional cgroup mounts from root NS automatically
> @@ -9,10 +9,10 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>   1 file changed, 45 insertions(+)
>  
>  diff --git a/src/systemdhook.c b/src/systemdhook.c
> -index 87a3585..5220c54 100644
> +index c2cb2b9..f9ec9f2 100644
>  --- a/src/systemdhook.c
>  +++ b/src/systemdhook.c
> -@@ -281,6 +281,11 @@ static char *get_process_cgroup_subsystem_path(const char *id, int pid, const ch
> +@@ -274,6 +274,11 @@ static char *get_process_cgroup_subsystem_path(const char *id, int pid, const ch
>   static int mount_cgroup(const char *id, const char *rootfs, const char *options, char *systemd_path)
>   {
>   	_cleanup_free_ char *cgroup_path = NULL;
> @@ -24,8 +24,8 @@ index 87a3585..5220c54 100644
>   
>   	if (asprintf(&cgroup_path, "%s/%s", rootfs, CGROUP_ROOT) < 0) {
>   		pr_perror("%s: Failed to create path for %s", id, CGROUP_ROOT);
> -@@ -290,6 +295,46 @@ static int mount_cgroup(const char *id, const char *rootfs, const char *options,
> - 		pr_perror("%s: Failed to mkdir new dest: %s", id, cgroup_path);
> +@@ -292,6 +297,46 @@ static int mount_cgroup(const char *id, const char *rootfs, const char *options,
> + 		pr_perror("%s: Failed to mkdir new dest: %s", id, systemd_path);
>   		return -1;
>   	}
>  +	/* Create all additional cgroup mounts which are in the root namespace */
> @@ -68,9 +68,9 @@ index 87a3585..5220c54 100644
>  +		free(dpath);
>  +	}
>  +	closedir(dir);
> - 	/* Mount tmpfs at new cgroup directory */
> - 	if (mount("tmpfs", cgroup_path, "tmpfs", MS_NODEV|MS_NOSUID, options) == -1) {
> - 		pr_perror("%s: Failed to mount tmpfs at %s", id, cgroup_path);
> + 	if (remount_readonly(id, cgroup_path, cgroup_path) < 0) {
> + 		return -1;
> + 	}
>  -- 
> -2.19.1
> +2.7.4
>  
> -- 
> 2.7.4
> 

