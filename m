Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C837E00CD5; Mon,  9 Sep 2019 10:28:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.42 listed in list.dnswl.org]
	*  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25CD9E008E3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:28:34 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id f12so30538474iog.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=CbTZgI8aWxh58w0i2414av0NvHPR6fwJnKcaNnVZw/Q=;
	b=IIMy/LgR1+c4A2Ja/M/lqaclVeXX1TUr2gtJOqCKxezYWKCYCMsi4Dwfd6yZhM686m
	QnKzFxyKu+n1tmwemNup31I7keMgwQCF3toa2U2vNYq8Xgi3ZWXSvmH1uZqdbyduyl5c
	EWYFULC0c38423CNvuwxeC6nhthtdtyUdN2o3eTx2vVu3JjZU1iIw/iNFWrnxA7i/MBt
	J19qncA7AC77NTewB4WxQ3wK/6VBFqdbgi2ohjdFuSKG3fl7npEBVJk4dF7CLbXW5ciN
	sr37Q0VaA5zasCBCIfW/tO+P9oFqxzTn/d2RO0p3M4ZnWz2fW7Yb9lmSMN5DYDFstMlc
	t49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=CbTZgI8aWxh58w0i2414av0NvHPR6fwJnKcaNnVZw/Q=;
	b=h1ITE1xfUHk+HmoP9prqM/J7qErh5gl76xPA8iVXllyZtKONW+lqy8q2YmCwut34Ph
	WbJ1qUMgUNIMf3iTFVRRD2z8g/9g/IjzLyeTwax7HEuBqL2JKHPc0iEDaA1E1XRqhnFL
	WxLntHuLPkXlbaD8CkcTP9RtEiw/q/t1kT2ziDK0YsaygkmsM8Ep0YSWWJIAGjfp6mZ2
	B8m0HSueuMVGXj9WrEgzLwaHAMqnsdCscYscLuW7W3FBh4dBAwHbUmg24P2PVgoK8wGL
	3Oq7vO9RgeJ/Z72QoYvABFjjDSHx4wKeicliPYIYM7jhPj+MHH1+EaJa3LYCqcFWRufy
	7U7A==
X-Gm-Message-State: APjAAAXRxPR1zVKxab45+8O4Nk7BVVXeNoaTjFTLMHJ6dQ7acbkMxV2P
	28BlN9V8bquOU0ZsiDecY8PDJyjPEi4=
X-Google-Smtp-Source: APXvYqzGbkQN/h3NloZAzV/+fDhaXj5d62GwDNXTwV8SRSYJJEm6eFjBaue8WDUTnfDmHKxpsmosxQ==
X-Received: by 2002:a05:6638:681:: with SMTP id
	i1mr26314633jab.127.1568050113726; 
	Mon, 09 Sep 2019 10:28:33 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	d1sm11467448iok.17.2019.09.09.10.28.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 10:28:33 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:28:31 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190909172830.GB26811@gmail.com>
References: <1567783813-16313-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1567783813-16313-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [thud][PATCH] libvirt: 9 Security fixes plus
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
X-List-Received-Date: Mon, 09 Sep 2019 17:28:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In message: [meta-virtualization] [thud][PATCH] libvirt: 9 Security fixes plus
on 06/09/2019 Armin Kuster wrote:

> From: Armin Kuster <akuster@mvista.com>
> 
> Source: libvirt.org
> MR: 98352, 99240, 99137, 99245, 99132
> Type: Security Fix
> Disposition: Backport from https://libvirt.org/git/?p=libvirt.git;a=log;h=refs/heads/v4.7-maint
> ChangeID: 95f822542723d4bf910c1b4159e1431d7d46c969
> Description:


merged to thud.

Bruce

> 
> Update to 4.7 maint tip all bug fixes.
> Includes:
> CVE-2018-12126
> CVE-2018-12127
> CVE-2018-12130
> CVE-2019-11091
> CVE-2019-10132
> CVE-2019-10161
> CVE-2019-10166
> CVE-2019-10167
> CVE-2019-10168
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  ...01-cpu_x86-Do-not-cache-microcode-version.patch |  59 ++
>  .../0002-qemu-Don-t-cache-microcode-version.patch  | 155 ++++
>  ...18-12127_CVE-2018-12130_CVE-2019-11091_p1.patch | 894 +++++++++++++++++++++
>  ...18-12127_CVE-2018-12130_CVE-2019-11091_p2.patch | 116 +++
>  .../libvirt/libvirt/CVE-2019-10132_p1.patch        |  63 ++
>  .../libvirt/libvirt/CVE-2019-10132_p2.patch        |  56 ++
>  .../libvirt/libvirt/CVE-2019-10132_p3.patch        |  56 ++
>  .../libvirt/libvirt/CVE-2019-10161.patch           |  99 +++
>  .../libvirt/libvirt/CVE-2019-10166.patch           |  43 +
>  .../libvirt/libvirt/CVE-2019-10167.patch           |  41 +
>  .../libvirt/libvirt/CVE-2019-10168.patch           |  49 ++
>  recipes-extended/libvirt/libvirt_4.7.0.bb          |  11 +
>  12 files changed, 1642 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-cpu_x86-Do-not-cache-microcode-version.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/0002-qemu-Don-t-cache-microcode-version.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p1.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p2.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10161.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10166.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10167.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10168.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-cpu_x86-Do-not-cache-microcode-version.patch b/recipes-extended/libvirt/libvirt/0001-cpu_x86-Do-not-cache-microcode-version.patch
> new file mode 100644
> index 0000000..4413d5f
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-cpu_x86-Do-not-cache-microcode-version.patch
> @@ -0,0 +1,59 @@
> +From 33998cdd47300fc3ca6cb8f85714c149440b9c8b Mon Sep 17 00:00:00 2001
> +From: Jiri Denemark <jdenemar@redhat.com>
> +Date: Fri, 5 Apr 2019 11:33:32 +0200
> +Subject: [PATCH 01/11] cpu_x86: Do not cache microcode version
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The microcode version checks are used to invalidate cached CPU data we
> +get from QEMU. To minimize /proc/cpuinfo parsing the microcode version
> +was only read when libvirtd started and cached for the daemon's
> +lifetime. However, the CPU microcode can change anytime (updating the
> +microcode package can automatically upload it to the CPU) and we need to
> +stop caching it to avoid using stale CPU model data.
> +
> +Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +(cherry picked from commit be46f613261d3b655a1f15afd635087e68a9c39b)
> +
> +Upstream-Status: Backport
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/cpu/cpu_x86.c | 5 +----
> + 1 file changed, 1 insertion(+), 4 deletions(-)
> +
> +diff --git a/src/cpu/cpu_x86.c b/src/cpu/cpu_x86.c
> +index cb27550..ce48ca6 100644
> +--- a/src/cpu/cpu_x86.c
> ++++ b/src/cpu/cpu_x86.c
> +@@ -163,7 +163,6 @@ struct _virCPUx86Map {
> + };
> + 
> + static virCPUx86MapPtr cpuMap;
> +-static unsigned int microcodeVersion;
> + 
> + int virCPUx86DriverOnceInit(void);
> + VIR_ONCE_GLOBAL_INIT(virCPUx86Driver);
> +@@ -1331,8 +1330,6 @@ virCPUx86DriverOnceInit(void)
> +     if (!(cpuMap = virCPUx86LoadMap()))
> +         return -1;
> + 
> +-    microcodeVersion = virHostCPUGetMicrocodeVersion();
> +-
> +     return 0;
> + }
> + 
> +@@ -2372,7 +2369,7 @@ virCPUx86GetHost(virCPUDefPtr cpu,
> +         goto cleanup;
> + 
> +     ret = x86DecodeCPUData(cpu, cpuData, models);
> +-    cpu->microcodeVersion = microcodeVersion;
> ++    cpu->microcodeVersion = virHostCPUGetMicrocodeVersion();
> + 
> +  cleanup:
> +     virCPUx86DataFree(cpuData);
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/0002-qemu-Don-t-cache-microcode-version.patch b/recipes-extended/libvirt/libvirt/0002-qemu-Don-t-cache-microcode-version.patch
> new file mode 100644
> index 0000000..6d0f298
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0002-qemu-Don-t-cache-microcode-version.patch
> @@ -0,0 +1,155 @@
> +From d606ac113007901522dab6c4b3979686d43eaa87 Mon Sep 17 00:00:00 2001
> +From: Jiri Denemark <jdenemar@redhat.com>
> +Date: Fri, 12 Apr 2019 21:21:05 +0200
> +Subject: [PATCH 02/11] qemu: Don't cache microcode version
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +My earlier commit be46f61326 was incomplete. It removed caching of
> +microcode version in the CPU driver, which means the capabilities XML
> +will see the correct microcode version. But it is also cached in the
> +QEMU capabilities cache where it is used to detect whether we need to
> +reprobe QEMU. By missing the second place, the original commit
> +be46f61326 made the situation even worse since libvirt would report
> +correct microcode version while still using the old host CPU model
> +(visible in domain capabilities XML).
> +
> +Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +(cherry picked from commit 673c62a3b7855a0685d8f116e227c402720b9ee9)
> +
> +Conflicts:
> +        src/qemu/qemu_capabilities.c
> +            - virQEMUCapsCacheLookupByArch refactoring (commits
> +              7948ad4129a and 1a3de67001c) are missing
> +
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/qemu/qemu_capabilities.c | 12 ++++++++----
> + src/qemu/qemu_capabilities.h |  3 +--
> + src/qemu/qemu_driver.c       |  9 +--------
> + tests/testutilsqemu.c        |  2 +-
> + 4 files changed, 11 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/qemu/qemu_capabilities.c b/src/qemu/qemu_capabilities.c
> +index a075677..eaf369f 100644
> +--- a/src/qemu/qemu_capabilities.c
> ++++ b/src/qemu/qemu_capabilities.c
> +@@ -4700,7 +4700,7 @@ virQEMUCapsNewData(const char *binary,
> +                                            priv->libDir,
> +                                            priv->runUid,
> +                                            priv->runGid,
> +-                                           priv->microcodeVersion,
> ++                                           virHostCPUGetMicrocodeVersion(),
> +                                            priv->kernelVersion);
> + }
> + 
> +@@ -4783,8 +4783,7 @@ virFileCachePtr
> + virQEMUCapsCacheNew(const char *libDir,
> +                     const char *cacheDir,
> +                     uid_t runUid,
> +-                    gid_t runGid,
> +-                    unsigned int microcodeVersion)
> ++                    gid_t runGid)
> + {
> +     char *capsCacheDir = NULL;
> +     virFileCachePtr cache = NULL;
> +@@ -4808,7 +4807,6 @@ virQEMUCapsCacheNew(const char *libDir,
> + 
> +     priv->runUid = runUid;
> +     priv->runGid = runGid;
> +-    priv->microcodeVersion = microcodeVersion;
> + 
> +     if (uname(&uts) == 0 &&
> +         virAsprintf(&priv->kernelVersion, "%s %s", uts.release, uts.version) < 0)
> +@@ -4829,8 +4827,11 @@ virQEMUCapsPtr
> + virQEMUCapsCacheLookup(virFileCachePtr cache,
> +                        const char *binary)
> + {
> ++    virQEMUCapsCachePrivPtr priv = virFileCacheGetPriv(cache);
> +     virQEMUCapsPtr ret = NULL;
> + 
> ++    priv->microcodeVersion = virHostCPUGetMicrocodeVersion();
> ++
> +     ret = virFileCacheLookup(cache, binary);
> + 
> +     VIR_DEBUG("Returning caps %p for %s", ret, binary);
> +@@ -4876,10 +4877,13 @@ virQEMUCapsPtr
> + virQEMUCapsCacheLookupByArch(virFileCachePtr cache,
> +                              virArch arch)
> + {
> ++    virQEMUCapsCachePrivPtr priv = virFileCacheGetPriv(cache);
> +     virQEMUCapsPtr ret = NULL;
> +     virArch target;
> +     struct virQEMUCapsSearchData data = { .arch = arch };
> + 
> ++    priv->microcodeVersion = virHostCPUGetMicrocodeVersion();
> ++
> +     ret = virFileCacheLookupByFunc(cache, virQEMUCapsCompareArch, &data);
> +     if (!ret) {
> +         /* If the first attempt at finding capabilities has failed, try
> +diff --git a/src/qemu/qemu_capabilities.h b/src/qemu/qemu_capabilities.h
> +index 3d3a978..956babc 100644
> +--- a/src/qemu/qemu_capabilities.h
> ++++ b/src/qemu/qemu_capabilities.h
> +@@ -574,8 +574,7 @@ void virQEMUCapsFilterByMachineType(virQEMUCapsPtr qemuCaps,
> + virFileCachePtr virQEMUCapsCacheNew(const char *libDir,
> +                                     const char *cacheDir,
> +                                     uid_t uid,
> +-                                    gid_t gid,
> +-                                    unsigned int microcodeVersion);
> ++                                    gid_t gid);
> + virQEMUCapsPtr virQEMUCapsCacheLookup(virFileCachePtr cache,
> +                                       const char *binary);
> + virQEMUCapsPtr virQEMUCapsCacheLookupCopy(virFileCachePtr cache,
> +diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
> +index a0f7c71..75f8699 100644
> +--- a/src/qemu/qemu_driver.c
> ++++ b/src/qemu/qemu_driver.c
> +@@ -592,8 +592,6 @@ qemuStateInitialize(bool privileged,
> +     char *hugepagePath = NULL;
> +     char *memoryBackingPath = NULL;
> +     size_t i;
> +-    virCPUDefPtr hostCPU = NULL;
> +-    unsigned int microcodeVersion = 0;
> + 
> +     if (VIR_ALLOC(qemu_driver) < 0)
> +         return -1;
> +@@ -813,15 +811,10 @@ qemuStateInitialize(bool privileged,
> +         run_gid = cfg->group;
> +     }
> + 
> +-    if ((hostCPU = virCPUProbeHost(virArchFromHost())))
> +-        microcodeVersion = hostCPU->microcodeVersion;
> +-    virCPUDefFree(hostCPU);
> +-
> +     qemu_driver->qemuCapsCache = virQEMUCapsCacheNew(cfg->libDir,
> +                                                      cfg->cacheDir,
> +                                                      run_uid,
> +-                                                     run_gid,
> +-                                                     microcodeVersion);
> ++                                                     run_gid);
> +     if (!qemu_driver->qemuCapsCache)
> +         goto error;
> + 
> +diff --git a/tests/testutilsqemu.c b/tests/testutilsqemu.c
> +index 8438613..4e53f03 100644
> +--- a/tests/testutilsqemu.c
> ++++ b/tests/testutilsqemu.c
> +@@ -707,7 +707,7 @@ int qemuTestDriverInit(virQEMUDriver *driver)
> + 
> +     /* Using /dev/null for libDir and cacheDir automatically produces errors
> +      * upon attempt to use any of them */
> +-    driver->qemuCapsCache = virQEMUCapsCacheNew("/dev/null", "/dev/null", 0, 0, 0);
> ++    driver->qemuCapsCache = virQEMUCapsCacheNew("/dev/null", "/dev/null", 0, 0);
> +     if (!driver->qemuCapsCache)
> +         goto error;
> + 
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p1.patch b/recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p1.patch
> new file mode 100644
> index 0000000..45f51d4
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p1.patch
> @@ -0,0 +1,894 @@
> +From b15a3c9f9bd24d12082b5a6ea505eb3ea48137cb Mon Sep 17 00:00:00 2001
> +From: Jiri Denemark <jdenemar@redhat.com>
> +Date: Fri, 5 Apr 2019 11:19:30 +0200
> +Subject: [PATCH 03/11] cputest: Add data for Intel(R) Xeon(R) CPU E3-1225 v5
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
> +(cherry picked from commit 5cd9db3ac11e88846cbcf95fad9f6fae9d880dee)
> +
> +CVE-2018-12126, CVE-2018-12127, CVE-2018-12130, CVE-2019-11091
> +
> +Conflicts:
> +	tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> +	tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> +            - intel-pt feature is missing
> +	    - stibp feature is missing
> +
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +
> +Upstream-Status: Backport
> +
> +CVE: CVE-2018-12126
> +CVE: CVE-2018-12127
> +CVE: CVE-2018-12130
> +CVE: CVE-2019-11091
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + tests/cputest.c                                    |   1 +
> + .../x86_64-cpuid-Xeon-E3-1225-v5-disabled.xml      |   7 +
> + .../x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml       |   8 +
> + .../x86_64-cpuid-Xeon-E3-1225-v5-guest.xml         |  26 +
> + .../x86_64-cpuid-Xeon-E3-1225-v5-host.xml          |  27 +
> + .../x86_64-cpuid-Xeon-E3-1225-v5-json.xml          |  10 +
> + .../cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.json  | 652 +++++++++++++++++++++
> + tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.sig |   4 +
> + tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.xml |  47 ++
> + 9 files changed, 782 insertions(+)
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-disabled.xml
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.json
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.sig
> + create mode 100644 tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.xml
> +
> +diff --git a/tests/cputest.c b/tests/cputest.c
> +index baf2b3c..fbb2a86 100644
> +--- a/tests/cputest.c
> ++++ b/tests/cputest.c
> +@@ -1190,6 +1190,7 @@ mymain(void)
> +     DO_TEST_CPUID(VIR_ARCH_X86_64, "Phenom-B95", JSON_HOST);
> +     DO_TEST_CPUID(VIR_ARCH_X86_64, "Ryzen-7-1800X-Eight-Core", JSON_HOST);
> +     DO_TEST_CPUID(VIR_ARCH_X86_64, "Xeon-5110", JSON_NONE);
> ++    DO_TEST_CPUID(VIR_ARCH_X86_64, "Xeon-E3-1225-v5", JSON_MODELS);
> +     DO_TEST_CPUID(VIR_ARCH_X86_64, "Xeon-E3-1245-v5", JSON_MODELS);
> +     DO_TEST_CPUID(VIR_ARCH_X86_64, "Xeon-E5-2609-v3", JSON_MODELS);
> +     DO_TEST_CPUID(VIR_ARCH_X86_64, "Xeon-E5-2623-v4", JSON_MODELS);
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-disabled.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-disabled.xml
> +new file mode 100644
> +index 0000000..ce51903
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-disabled.xml
> +@@ -0,0 +1,7 @@
> ++<!-- Features disabled by QEMU -->
> ++<cpudata arch='x86'>
> ++  <cpuid eax_in='0x00000001' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x0800c1fc' edx='0xb0600000'/>
> ++  <cpuid eax_in='0x00000007' ecx_in='0x00' eax='0x00000000' ebx='0x02000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x01' eax='0x00000008' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80000007' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000100'/>
> ++</cpudata>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml
> +new file mode 100644
> +index 0000000..0deca9f
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml
> +@@ -0,0 +1,8 @@
> ++<!-- Features enabled by QEMU -->
> ++<cpudata arch='x86'>
> ++  <cpuid eax_in='0x00000001' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0xf7fa3203' edx='0x0f8bfbff'/>
> ++  <cpuid eax_in='0x00000006' ecx_in='0x00' eax='0x00000004' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000007' ecx_in='0x00' eax='0x00000000' ebx='0x009c4fbb' ecx='0x00000000' edx='0x8c000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x01' eax='0x00000007' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80000001' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000121' edx='0x2c100800'/>
> ++</cpudata>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> +new file mode 100644
> +index 0000000..993db80
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> +@@ -0,0 +1,26 @@
> ++<cpu mode='custom' match='exact'>
> ++  <model fallback='forbid'>Skylake-Client-IBRS</model>
> ++  <vendor>Intel</vendor>
> ++  <feature policy='require' name='ds'/>
> ++  <feature policy='require' name='acpi'/>
> ++  <feature policy='require' name='ss'/>
> ++  <feature policy='require' name='ht'/>
> ++  <feature policy='require' name='tm'/>
> ++  <feature policy='require' name='pbe'/>
> ++  <feature policy='require' name='dtes64'/>
> ++  <feature policy='require' name='monitor'/>
> ++  <feature policy='require' name='ds_cpl'/>
> ++  <feature policy='require' name='vmx'/>
> ++  <feature policy='require' name='smx'/>
> ++  <feature policy='require' name='est'/>
> ++  <feature policy='require' name='tm2'/>
> ++  <feature policy='require' name='xtpr'/>
> ++  <feature policy='require' name='pdcm'/>
> ++  <feature policy='require' name='osxsave'/>
> ++  <feature policy='require' name='tsc_adjust'/>
> ++  <feature policy='require' name='clflushopt'/>
> ++  <feature policy='require' name='ssbd'/>
> ++  <feature policy='require' name='xsaves'/>
> ++  <feature policy='require' name='pdpe1gb'/>
> ++  <feature policy='require' name='invtsc'/>
> ++</cpu>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> +new file mode 100644
> +index 0000000..074a39b
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> +@@ -0,0 +1,27 @@
> ++<cpu>
> ++  <arch>x86_64</arch>
> ++  <model>Skylake-Client-IBRS</model>
> ++  <vendor>Intel</vendor>
> ++  <feature name='ds'/>
> ++  <feature name='acpi'/>
> ++  <feature name='ss'/>
> ++  <feature name='ht'/>
> ++  <feature name='tm'/>
> ++  <feature name='pbe'/>
> ++  <feature name='dtes64'/>
> ++  <feature name='monitor'/>
> ++  <feature name='ds_cpl'/>
> ++  <feature name='vmx'/>
> ++  <feature name='smx'/>
> ++  <feature name='est'/>
> ++  <feature name='tm2'/>
> ++  <feature name='xtpr'/>
> ++  <feature name='pdcm'/>
> ++  <feature name='osxsave'/>
> ++  <feature name='tsc_adjust'/>
> ++  <feature name='clflushopt'/>
> ++  <feature name='ssbd'/>
> ++  <feature name='xsaves'/>
> ++  <feature name='pdpe1gb'/>
> ++  <feature name='invtsc'/>
> ++</cpu>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml
> +new file mode 100644
> +index 0000000..1984bd4
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml
> +@@ -0,0 +1,10 @@
> ++<cpu mode='custom' match='exact'>
> ++  <model fallback='forbid'>Skylake-Client-IBRS</model>
> ++  <vendor>Intel</vendor>
> ++  <feature policy='require' name='ss'/>
> ++  <feature policy='require' name='hypervisor'/>
> ++  <feature policy='require' name='tsc_adjust'/>
> ++  <feature policy='require' name='clflushopt'/>
> ++  <feature policy='require' name='ssbd'/>
> ++  <feature policy='require' name='pdpe1gb'/>
> ++</cpu>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.json b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.json
> +new file mode 100644
> +index 0000000..0847475
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.json
> +@@ -0,0 +1,652 @@
> ++{
> ++  "return": {
> ++    "model": {
> ++      "name": "base",
> ++      "props": {
> ++        "phys-bits": 0,
> ++        "core-id": -1,
> ++        "xlevel": 2147483656,
> ++        "cmov": true,
> ++        "ia64": false,
> ++        "aes": true,
> ++        "mmx": true,
> ++        "rdpid": false,
> ++        "arat": true,
> ++        "gfni": false,
> ++        "pause-filter": false,
> ++        "xsavec": true,
> ++        "intel-pt": false,
> ++        "osxsave": false,
> ++        "hv-frequencies": false,
> ++        "tsc-frequency": 0,
> ++        "xd": true,
> ++        "hv-vendor-id": "",
> ++        "kvm-asyncpf": true,
> ++        "kvm_asyncpf": true,
> ++        "perfctr_core": false,
> ++        "perfctr-core": false,
> ++        "mpx": true,
> ++        "pbe": false,
> ++        "decodeassists": false,
> ++        "avx512cd": false,
> ++        "sse4_1": true,
> ++        "sse4.1": true,
> ++        "sse4-1": true,
> ++        "family": 6,
> ++        "legacy-cache": true,
> ++        "vmware-cpuid-freq": true,
> ++        "avx512f": false,
> ++        "msr": true,
> ++        "mce": true,
> ++        "mca": true,
> ++        "hv-runtime": false,
> ++        "xcrypt": false,
> ++        "thread-id": -1,
> ++        "min-level": 13,
> ++        "xgetbv1": true,
> ++        "cid": false,
> ++        "hv-relaxed": false,
> ++        "hv-crash": false,
> ++        "ds": false,
> ++        "fxsr": true,
> ++        "xsaveopt": true,
> ++        "xtpr": false,
> ++        "avx512vl": false,
> ++        "avx512-vpopcntdq": false,
> ++        "phe": false,
> ++        "extapic": false,
> ++        "3dnowprefetch": true,
> ++        "avx512vbmi2": false,
> ++        "cr8legacy": false,
> ++        "stibp": true,
> ++        "cpuid-0xb": true,
> ++        "xcrypt-en": false,
> ++        "kvm_pv_eoi": true,
> ++        "apic-id": 4294967295,
> ++        "pn": false,
> ++        "dca": false,
> ++        "vendor": "GenuineIntel",
> ++        "pku": false,
> ++        "smx": false,
> ++        "cmp_legacy": false,
> ++        "cmp-legacy": false,
> ++        "node-id": -1,
> ++        "avx512-4fmaps": false,
> ++        "vmcb_clean": false,
> ++        "vmcb-clean": false,
> ++        "3dnowext": false,
> ++        "hle": true,
> ++        "npt": false,
> ++        "memory": "/machine/unattached/system[0]",
> ++        "clwb": false,
> ++        "lbrv": false,
> ++        "adx": true,
> ++        "ss": true,
> ++        "pni": true,
> ++        "svm_lock": false,
> ++        "svm-lock": false,
> ++        "pfthreshold": false,
> ++        "smep": true,
> ++        "smap": true,
> ++        "x2apic": true,
> ++        "avx512vbmi": false,
> ++        "avx512vnni": false,
> ++        "hv-stimer": false,
> ++        "i64": true,
> ++        "flushbyasid": false,
> ++        "f16c": true,
> ++        "ace2-en": false,
> ++        "pat": true,
> ++        "pae": true,
> ++        "sse": true,
> ++        "phe-en": false,
> ++        "kvm_nopiodelay": true,
> ++        "kvm-nopiodelay": true,
> ++        "tm": false,
> ++        "kvmclock-stable-bit": true,
> ++        "hypervisor": true,
> ++        "socket-id": -1,
> ++        "pcommit": false,
> ++        "syscall": true,
> ++        "level": 13,
> ++        "avx512dq": false,
> ++        "svm": false,
> ++        "full-cpuid-auto-level": true,
> ++        "hv-reset": false,
> ++        "invtsc": false,
> ++        "sse3": true,
> ++        "sse2": true,
> ++        "ssbd": true,
> ++        "est": false,
> ++        "avx512ifma": false,
> ++        "tm2": false,
> ++        "kvm-pv-eoi": true,
> ++        "cx8": true,
> ++        "kvm_mmu": false,
> ++        "kvm-mmu": false,
> ++        "sse4_2": true,
> ++        "sse4.2": true,
> ++        "sse4-2": true,
> ++        "pge": true,
> ++        "fill-mtrr-mask": true,
> ++        "avx512bitalg": false,
> ++        "nodeid_msr": false,
> ++        "pdcm": false,
> ++        "movbe": true,
> ++        "model": 94,
> ++        "nrip_save": false,
> ++        "nrip-save": false,
> ++        "kvm_pv_unhalt": true,
> ++        "ssse3": true,
> ++        "sse4a": false,
> ++        "invpcid": true,
> ++        "pdpe1gb": true,
> ++        "tsc-deadline": true,
> ++        "fma": true,
> ++        "cx16": true,
> ++        "de": true,
> ++        "enforce": false,
> ++        "stepping": 3,
> ++        "xsave": true,
> ++        "clflush": true,
> ++        "skinit": false,
> ++        "tsc": true,
> ++        "tce": false,
> ++        "fpu": true,
> ++        "ibs": false,
> ++        "ds_cpl": false,
> ++        "ds-cpl": false,
> ++        "host-phys-bits": true,
> ++        "fma4": false,
> ++        "la57": false,
> ++        "osvw": false,
> ++        "check": true,
> ++        "hv-spinlocks": -1,
> ++        "pmu": false,
> ++        "pmm": false,
> ++        "apic": true,
> ++        "spec-ctrl": true,
> ++        "min-xlevel2": 0,
> ++        "tsc-adjust": true,
> ++        "tsc_adjust": true,
> ++        "kvm-steal-time": true,
> ++        "kvm_steal_time": true,
> ++        "kvmclock": true,
> ++        "l3-cache": true,
> ++        "lwp": false,
> ++        "ibpb": false,
> ++        "xop": false,
> ++        "avx": true,
> ++        "ospke": false,
> ++        "ace2": false,
> ++        "avx512bw": false,
> ++        "acpi": false,
> ++        "hv-vapic": false,
> ++        "fsgsbase": true,
> ++        "ht": false,
> ++        "nx": true,
> ++        "pclmulqdq": true,
> ++        "mmxext": false,
> ++        "vaes": false,
> ++        "popcnt": true,
> ++        "xsaves": false,
> ++        "tcg-cpuid": true,
> ++        "lm": true,
> ++        "umip": false,
> ++        "pse": true,
> ++        "avx2": true,
> ++        "sep": true,
> ++        "pclmuldq": true,
> ++        "virt-ssbd": false,
> ++        "x-hv-max-vps": -1,
> ++        "nodeid-msr": false,
> ++        "md-clear": true,
> ++        "kvm": true,
> ++        "misalignsse": false,
> ++        "min-xlevel": 2147483656,
> ++        "kvm-pv-unhalt": true,
> ++        "bmi2": true,
> ++        "bmi1": true,
> ++        "realized": false,
> ++        "tsc_scale": false,
> ++        "tsc-scale": false,
> ++        "topoext": false,
> ++        "hv-vpindex": false,
> ++        "xlevel2": 0,
> ++        "clflushopt": true,
> ++        "kvm-no-smi-migration": false,
> ++        "monitor": false,
> ++        "avx512er": false,
> ++        "pmm-en": false,
> ++        "pcid": true,
> ++        "3dnow": false,
> ++        "erms": true,
> ++        "lahf-lm": true,
> ++        "lahf_lm": true,
> ++        "vpclmulqdq": false,
> ++        "fxsr-opt": false,
> ++        "hv-synic": false,
> ++        "xstore": false,
> ++        "fxsr_opt": false,
> ++        "kvm-hint-dedicated": false,
> ++        "rtm": true,
> ++        "lmce": true,
> ++        "hv-time": false,
> ++        "perfctr-nb": false,
> ++        "perfctr_nb": false,
> ++        "ffxsr": false,
> ++        "rdrand": true,
> ++        "rdseed": true,
> ++        "avx512-4vnniw": false,
> ++        "vmx": false,
> ++        "vme": true,
> ++        "dtes64": false,
> ++        "mtrr": true,
> ++        "rdtscp": true,
> ++        "pse36": true,
> ++        "kvm-pv-tlb-flush": false,
> ++        "tbm": false,
> ++        "wdt": false,
> ++        "pause_filter": false,
> ++        "sha-ni": false,
> ++        "model-id": "Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz",
> ++        "abm": true,
> ++        "avx512pf": false,
> ++        "xstore-en": false
> ++      }
> ++    }
> ++  },
> ++  "id": "model-expansion"
> ++}
> ++
> ++{
> ++  "return": [
> ++    {
> ++      "name": "max",
> ++      "typename": "max-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": false
> ++    },
> ++    {
> ++      "name": "host",
> ++      "typename": "host-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": false
> ++    },
> ++    {
> ++      "name": "base",
> ++      "typename": "base-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": true,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "qemu64",
> ++      "typename": "qemu64-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "qemu32",
> ++      "typename": "qemu32-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "phenom",
> ++      "typename": "phenom-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "mmxext",
> ++        "fxsr-opt",
> ++        "3dnowext",
> ++        "3dnow",
> ++        "sse4a",
> ++        "npt"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "pentium3",
> ++      "typename": "pentium3-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "pentium2",
> ++      "typename": "pentium2-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "pentium",
> ++      "typename": "pentium-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "n270",
> ++      "typename": "n270-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "kvm64",
> ++      "typename": "kvm64-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "kvm32",
> ++      "typename": "kvm32-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "cpu64-rhel6",
> ++      "typename": "cpu64-rhel6-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "sse4a"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "coreduo",
> ++      "typename": "coreduo-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "core2duo",
> ++      "typename": "core2duo-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "athlon",
> ++      "typename": "athlon-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "mmxext",
> ++        "3dnowext",
> ++        "3dnow"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Westmere",
> ++      "typename": "Westmere-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Westmere-IBRS",
> ++      "typename": "Westmere-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Skylake-Server",
> ++      "typename": "Skylake-Server-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "avx512f",
> ++        "avx512dq",
> ++        "clwb",
> ++        "avx512cd",
> ++        "avx512bw",
> ++        "avx512vl",
> ++        "avx512f",
> ++        "avx512f",
> ++        "avx512f"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Skylake-Server-IBRS",
> ++      "typename": "Skylake-Server-IBRS-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "avx512f",
> ++        "avx512dq",
> ++        "clwb",
> ++        "avx512cd",
> ++        "avx512bw",
> ++        "avx512vl",
> ++        "avx512f",
> ++        "avx512f",
> ++        "avx512f"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Skylake-Client",
> ++      "typename": "Skylake-Client-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Skylake-Client-IBRS",
> ++      "typename": "Skylake-Client-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "SandyBridge",
> ++      "typename": "SandyBridge-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "SandyBridge-IBRS",
> ++      "typename": "SandyBridge-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Penryn",
> ++      "typename": "Penryn-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Opteron_G5",
> ++      "typename": "Opteron_G5-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "sse4a",
> ++        "misalignsse",
> ++        "xop",
> ++        "fma4",
> ++        "tbm"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Opteron_G4",
> ++      "typename": "Opteron_G4-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "sse4a",
> ++        "misalignsse",
> ++        "xop",
> ++        "fma4"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Opteron_G3",
> ++      "typename": "Opteron_G3-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "sse4a",
> ++        "misalignsse"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Opteron_G2",
> ++      "typename": "Opteron_G2-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Opteron_G1",
> ++      "typename": "Opteron_G1-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Nehalem",
> ++      "typename": "Nehalem-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Nehalem-IBRS",
> ++      "typename": "Nehalem-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "IvyBridge",
> ++      "typename": "IvyBridge-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "IvyBridge-IBRS",
> ++      "typename": "IvyBridge-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Haswell",
> ++      "typename": "Haswell-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Haswell-noTSX",
> ++      "typename": "Haswell-noTSX-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Haswell-noTSX-IBRS",
> ++      "typename": "Haswell-noTSX-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Haswell-IBRS",
> ++      "typename": "Haswell-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "EPYC",
> ++      "typename": "EPYC-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "sha-ni",
> ++        "mmxext",
> ++        "fxsr-opt",
> ++        "cr8legacy",
> ++        "sse4a",
> ++        "misalignsse",
> ++        "osvw"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "EPYC-IBPB",
> ++      "typename": "EPYC-IBPB-x86_64-cpu",
> ++      "unavailable-features": [
> ++        "sha-ni",
> ++        "mmxext",
> ++        "fxsr-opt",
> ++        "cr8legacy",
> ++        "sse4a",
> ++        "misalignsse",
> ++        "osvw",
> ++        "ibpb"
> ++      ],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Conroe",
> ++      "typename": "Conroe-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Broadwell",
> ++      "typename": "Broadwell-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Broadwell-noTSX",
> ++      "typename": "Broadwell-noTSX-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Broadwell-noTSX-IBRS",
> ++      "typename": "Broadwell-noTSX-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "Broadwell-IBRS",
> ++      "typename": "Broadwell-IBRS-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    },
> ++    {
> ++      "name": "486",
> ++      "typename": "486-x86_64-cpu",
> ++      "unavailable-features": [],
> ++      "static": false,
> ++      "migration-safe": true
> ++    }
> ++  ],
> ++  "id": "definitions"
> ++}
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.sig b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.sig
> +new file mode 100644
> +index 0000000..7e57c2d
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.sig
> +@@ -0,0 +1,4 @@
> ++0506e3
> ++family:     6 (0x06)
> ++model:     94 (0x5e)
> ++stepping:   3 (0x03)
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.xml
> +new file mode 100644
> +index 0000000..437429d
> +--- /dev/null
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5.xml
> +@@ -0,0 +1,47 @@
> ++<!-- Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz -->
> ++<cpudata arch='x86'>
> ++  <cpuid eax_in='0x00000000' ecx_in='0x00' eax='0x00000016' ebx='0x756e6547' ecx='0x6c65746e' edx='0x49656e69'/>
> ++  <cpuid eax_in='0x00000001' ecx_in='0x00' eax='0x000506e3' ebx='0x06100800' ecx='0x7ffafbff' edx='0xbfebfbff'/>
> ++  <cpuid eax_in='0x00000002' ecx_in='0x00' eax='0x76036301' ebx='0x00f0b6ff' ecx='0x00000000' edx='0x00c30000'/>
> ++  <cpuid eax_in='0x00000003' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000004' ecx_in='0x00' eax='0x1c004121' ebx='0x01c0003f' ecx='0x0000003f' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000004' ecx_in='0x01' eax='0x1c004122' ebx='0x01c0003f' ecx='0x0000003f' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000004' ecx_in='0x02' eax='0x1c004143' ebx='0x00c0003f' ecx='0x000003ff' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000004' ecx_in='0x03' eax='0x1c03c163' ebx='0x03c0003f' ecx='0x00001fff' edx='0x00000006'/>
> ++  <cpuid eax_in='0x00000005' ecx_in='0x00' eax='0x00000040' ebx='0x00000040' ecx='0x00000003' edx='0x00142120'/>
> ++  <cpuid eax_in='0x00000006' ecx_in='0x00' eax='0x000027f7' ebx='0x00000002' ecx='0x00000009' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000007' ecx_in='0x00' eax='0x00000000' ebx='0x029c6fbf' ecx='0x00000000' edx='0x9c002400'/>
> ++  <cpuid eax_in='0x00000008' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000009' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000a' ecx_in='0x00' eax='0x07300804' ebx='0x00000000' ecx='0x00000000' edx='0x00000603'/>
> ++  <cpuid eax_in='0x0000000b' ecx_in='0x00' eax='0x00000001' ebx='0x00000001' ecx='0x00000100' edx='0x00000006'/>
> ++  <cpuid eax_in='0x0000000b' ecx_in='0x01' eax='0x00000004' ebx='0x00000004' ecx='0x00000201' edx='0x00000006'/>
> ++  <cpuid eax_in='0x0000000c' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x00' eax='0x0000001f' ebx='0x00000440' ecx='0x00000440' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x01' eax='0x0000000f' ebx='0x000003c0' ecx='0x00000100' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x02' eax='0x00000100' ebx='0x00000240' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x03' eax='0x00000040' ebx='0x000003c0' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x04' eax='0x00000040' ebx='0x00000400' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000d' ecx_in='0x08' eax='0x00000080' ebx='0x00000000' ecx='0x00000001' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000e' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x0000000f' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000010' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000011' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000012' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000013' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000014' ecx_in='0x00' eax='0x00000001' ebx='0x0000000f' ecx='0x00000007' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000014' ecx_in='0x01' eax='0x02490002' ebx='0x003f3fff' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000015' ecx_in='0x00' eax='0x00000002' ebx='0x00000114' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x00000016' ecx_in='0x00' eax='0x00000ce4' ebx='0x00000e74' ecx='0x00000064' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80000000' ecx_in='0x00' eax='0x80000008' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80000001' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000121' edx='0x2c100800'/>
> ++  <cpuid eax_in='0x80000002' ecx_in='0x00' eax='0x65746e49' ebx='0x2952286c' ecx='0x6f655820' edx='0x2952286e'/>
> ++  <cpuid eax_in='0x80000003' ecx_in='0x00' eax='0x55504320' ebx='0x2d334520' ecx='0x35323231' edx='0x20357620'/>
> ++  <cpuid eax_in='0x80000004' ecx_in='0x00' eax='0x2e332040' ebx='0x48473033' ecx='0x0000007a' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80000005' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80000006' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x01006040' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80000007' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000000' edx='0x00000100'/>
> ++  <cpuid eax_in='0x80000008' ecx_in='0x00' eax='0x00003027' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> ++  <cpuid eax_in='0x80860000' ecx_in='0x00' eax='0x00000ce4' ebx='0x00000e74' ecx='0x00000064' edx='0x00000000'/>
> ++  <cpuid eax_in='0xc0000000' ecx_in='0x00' eax='0x00000ce4' ebx='0x00000e74' ecx='0x00000064' edx='0x00000000'/>
> ++</cpudata>
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p2.patch b/recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p2.patch
> new file mode 100644
> index 0000000..b39e866
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p2.patch
> @@ -0,0 +1,116 @@
> +From c811c618c114c4a6493ede602bdca22d33c1972a Mon Sep 17 00:00:00 2001
> +From: Jiri Denemark <jdenemar@redhat.com>
> +Date: Tue, 9 Apr 2019 12:35:52 +0200
> +Subject: [PATCH 04/11] cpu_map: Define md-clear CPUID bit
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE-2018-12126, CVE-2018-12127, CVE-2018-12130, CVE-2019-11091
> +
> +The bit is set when microcode provides the mechanism to invoke a flush
> +of various exploitable CPU buffers by invoking the VERW instruction.
> +
> +Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> +Signed-off-by: Jiri Denemark <jdenemar@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit 538d873571d7a682852dc1d70e5f4478f4d64e85)
> +
> +Conflicts:
> +        src/cpu_map/x86_features.xml
> +            - missing pconfig feature
> +
> +        tests/cputestdata/x86_64-cpuid-Xeon-Platinum-8268-guest.xml
> +        tests/cputestdata/x86_64-cpuid-Xeon-Platinum-8268-host.xml
> +            - test data missing downstream
> +
> +        tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> +        tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> +            - intel-pt feature is missing
> +	    - stibp feature is missing
> +
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +
> +Upstream-Status: Backport
> +
> +CVE: CVE-2018-12126 
> +CVE: CVE-2018-12127 
> +CVE: CVE-2018-12130 
> +CVE: CVE-2019-11091
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/cpu_map/x86_features.xml                               | 3 +++
> + tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml | 2 +-
> + tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml   | 1 +
> + tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml    | 1 +
> + tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml    | 1 +
> + 5 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/cpu_map/x86_features.xml b/src/cpu_map/x86_features.xml
> +index 109c653..c8ae540 100644
> +--- a/src/cpu_map/x86_features.xml
> ++++ b/src/cpu_map/x86_features.xml
> +@@ -290,6 +290,9 @@
> +   <feature name='avx512-4fmaps'>
> +     <cpuid eax_in='0x07' ecx_in='0x00' edx='0x00000008'/>
> +   </feature>
> ++  <feature name='md-clear'> <!-- md_clear -->
> ++    <cpuid eax_in='0x07' ecx_in='0x00' edx='0x00000400'/>
> ++  </feature>
> +   <feature name='spec-ctrl'>
> +     <cpuid eax_in='0x07' ecx_in='0x00' edx='0x04000000'/>
> +   </feature>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml
> +index 0deca9f..74763a4 100644
> +--- a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-enabled.xml
> +@@ -2,7 +2,7 @@
> + <cpudata arch='x86'>
> +   <cpuid eax_in='0x00000001' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0xf7fa3203' edx='0x0f8bfbff'/>
> +   <cpuid eax_in='0x00000006' ecx_in='0x00' eax='0x00000004' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> +-  <cpuid eax_in='0x00000007' ecx_in='0x00' eax='0x00000000' ebx='0x009c4fbb' ecx='0x00000000' edx='0x8c000000'/>
> ++  <cpuid eax_in='0x00000007' ecx_in='0x00' eax='0x00000000' ebx='0x009c4fbb' ecx='0x00000000' edx='0x8c000400'/>
> +   <cpuid eax_in='0x0000000d' ecx_in='0x01' eax='0x00000007' ebx='0x00000000' ecx='0x00000000' edx='0x00000000'/>
> +   <cpuid eax_in='0x80000001' ecx_in='0x00' eax='0x00000000' ebx='0x00000000' ecx='0x00000121' edx='0x2c100800'/>
> + </cpudata>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> +index 993db80..29c1fdb 100644
> +--- a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-guest.xml
> +@@ -19,6 +19,7 @@
> +   <feature policy='require' name='osxsave'/>
> +   <feature policy='require' name='tsc_adjust'/>
> +   <feature policy='require' name='clflushopt'/>
> ++  <feature policy='require' name='md-clear'/>
> +   <feature policy='require' name='ssbd'/>
> +   <feature policy='require' name='xsaves'/>
> +   <feature policy='require' name='pdpe1gb'/>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> +index 074a39b..2003ca9 100644
> +--- a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-host.xml
> +@@ -20,6 +20,7 @@
> +   <feature name='osxsave'/>
> +   <feature name='tsc_adjust'/>
> +   <feature name='clflushopt'/>
> ++  <feature name='md-clear'/>
> +   <feature name='ssbd'/>
> +   <feature name='xsaves'/>
> +   <feature name='pdpe1gb'/>
> +diff --git a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml
> +index 1984bd4..d6529c5 100644
> +--- a/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml
> ++++ b/tests/cputestdata/x86_64-cpuid-Xeon-E3-1225-v5-json.xml
> +@@ -5,6 +5,7 @@
> +   <feature policy='require' name='hypervisor'/>
> +   <feature policy='require' name='tsc_adjust'/>
> +   <feature policy='require' name='clflushopt'/>
> ++  <feature policy='require' name='md-clear'/>
> +   <feature policy='require' name='ssbd'/>
> +   <feature policy='require' name='pdpe1gb'/>
> + </cpu>
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch
> new file mode 100644
> index 0000000..11c1c5d
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch
> @@ -0,0 +1,63 @@
> +From dfd22fc50f8f268b9810d2ef21adada021f740eb Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Tue, 30 Apr 2019 17:26:13 +0100
> +Subject: [PATCH 05/11] admin: reject clients unless their UID matches the
> + current UID
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The admin protocol RPC messages are only intended for use by the user
> +running the daemon. As such they should not be allowed for any client
> +UID that does not match the server UID.
> +
> +Fixes CVE-2019-10132
> +
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit 96f41cd765c9e525fe28ee5abbfbf4a79b3720c7)
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10132
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/admin/admin_server_dispatch.c | 22 ++++++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> +
> +diff --git a/src/admin/admin_server_dispatch.c b/src/admin/admin_server_dispatch.c
> +index b78ff90..9f25813 100644
> +--- a/src/admin/admin_server_dispatch.c
> ++++ b/src/admin/admin_server_dispatch.c
> +@@ -66,6 +66,28 @@ remoteAdmClientNew(virNetServerClientPtr client ATTRIBUTE_UNUSED,
> +                    void *opaque)
> + {
> +     struct daemonAdmClientPrivate *priv;
> ++    uid_t clientuid;
> ++    gid_t clientgid;
> ++    pid_t clientpid;
> ++    unsigned long long timestamp;
> ++
> ++    if (virNetServerClientGetUNIXIdentity(client,
> ++                                          &clientuid,
> ++                                          &clientgid,
> ++                                          &clientpid,
> ++                                          &timestamp) < 0)
> ++        return NULL;
> ++
> ++    VIR_DEBUG("New client pid %lld uid %lld",
> ++              (long long)clientpid,
> ++              (long long)clientuid);
> ++
> ++    if (geteuid() != clientuid) {
> ++        virReportRestrictedError(_("Disallowing client %lld with uid %lld"),
> ++                                 (long long)clientpid,
> ++                                 (long long)clientuid);
> ++        return NULL;
> ++    }
> + 
> +     if (VIR_ALLOC(priv) < 0)
> +         return NULL;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch
> new file mode 100644
> index 0000000..860c1e5
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch
> @@ -0,0 +1,56 @@
> +From 54005b84b0165b62b2ef88c7df229bddbaa29e76 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Tue, 30 Apr 2019 16:51:37 +0100
> +Subject: [PATCH 06/11] locking: restrict sockets to mode 0600
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virtlockd daemon's only intended client is the libvirtd daemon. As
> +such it should never allow clients from other user accounts to connect.
> +The code already enforces this and drops clients from other UIDs, but
> +we can get earlier (and thus stronger) protection against DoS by setting
> +the socket permissions to 0600
> +
> +Fixes CVE-2019-10132
> +
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit f111e09468693909b1f067aa575efdafd9a262a1)
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10132
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/locking/virtlockd-admin.socket.in | 1 +
> + src/locking/virtlockd.socket.in       | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/src/locking/virtlockd-admin.socket.in b/src/locking/virtlockd-admin.socket.in
> +index 2a7500f..f674c49 100644
> +--- a/src/locking/virtlockd-admin.socket.in
> ++++ b/src/locking/virtlockd-admin.socket.in
> +@@ -5,6 +5,7 @@ Before=libvirtd.service
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlockd-admin-sock
> + Service=virtlockd.service
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +diff --git a/src/locking/virtlockd.socket.in b/src/locking/virtlockd.socket.in
> +index 45e0f20..d701b27 100644
> +--- a/src/locking/virtlockd.socket.in
> ++++ b/src/locking/virtlockd.socket.in
> +@@ -4,6 +4,7 @@ Before=libvirtd.service
> + 
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlockd-sock
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch
> new file mode 100644
> index 0000000..ddd0740
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch
> @@ -0,0 +1,56 @@
> +From 030fdf57255f97289a407529194bf26c77548acb Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Tue, 30 Apr 2019 17:27:41 +0100
> +Subject: [PATCH 07/11] logging: restrict sockets to mode 0600
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virtlogd daemon's only intended client is the libvirtd daemon. As
> +such it should never allow clients from other user accounts to connect.
> +The code already enforces this and drops clients from other UIDs, but
> +we can get earlier (and thus stronger) protection against DoS by setting
> +the socket permissions to 0600
> +
> +Fixes CVE-2019-10132
> +
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit e37bd65f9948c1185456b2cdaa3bd6e875af680f)
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10132
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/logging/virtlogd-admin.socket.in | 1 +
> + src/logging/virtlogd.socket.in       | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/src/logging/virtlogd-admin.socket.in b/src/logging/virtlogd-admin.socket.in
> +index 595e6c4..5c41dfe 100644
> +--- a/src/logging/virtlogd-admin.socket.in
> ++++ b/src/logging/virtlogd-admin.socket.in
> +@@ -5,6 +5,7 @@ Before=libvirtd.service
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlogd-admin-sock
> + Service=virtlogd.service
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +diff --git a/src/logging/virtlogd.socket.in b/src/logging/virtlogd.socket.in
> +index 22b9360..ae48cda 100644
> +--- a/src/logging/virtlogd.socket.in
> ++++ b/src/logging/virtlogd.socket.in
> +@@ -4,6 +4,7 @@ Before=libvirtd.service
> + 
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlogd-sock
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10161.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10161.patch
> new file mode 100644
> index 0000000..118ece4
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10161.patch
> @@ -0,0 +1,99 @@
> +From 3352c8af264a7b9b741208790ecca0bbc6733f42 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 08:47:42 +0200
> +Subject: [PATCH 08/11] api: disallow virDomainSaveImageGetXMLDesc on read-only
> + connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virDomainSaveImageGetXMLDesc API is taking a path parameter,
> +which can point to any path on the system. This file will then be
> +read and parsed by libvirtd running with root privileges.
> +
> +Forbid it on read-only connections.
> +
> +Fixes: CVE-2019-10161
> +Reported-by: Matthias Gerstner <mgerstner@suse.de>
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit aed6a032cead4386472afb24b16196579e239580)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Conflicts:
> +  src/libvirt-domain.c
> +  src/remote/remote_protocol.x
> +
> +Upstream commit 12a51f372 which introduced the VIR_DOMAIN_SAVE_IMAGE_XML_SECURE
> +alias for VIR_DOMAIN_XML_SECURE is not backported.
> +Just skip the commit since we now disallow the whole API on read-only
> +connections, regardless of the flag.
> +
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10161
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/libvirt-domain.c         | 11 ++---------
> + src/qemu/qemu_driver.c       |  2 +-
> + src/remote/remote_protocol.x |  3 +--
> + 3 files changed, 4 insertions(+), 12 deletions(-)
> +
> +Index: libvirt-4.7.0/src/libvirt-domain.c
> +===================================================================
> +--- libvirt-4.7.0.orig/src/libvirt-domain.c
> ++++ libvirt-4.7.0/src/libvirt-domain.c
> +@@ -1073,9 +1073,7 @@ virDomainRestoreFlags(virConnectPtr conn
> +  * previously by virDomainSave() or virDomainSaveFlags().
> +  *
> +  * No security-sensitive data will be included unless @flags contains
> +- * VIR_DOMAIN_XML_SECURE; this flag is rejected on read-only
> +- * connections.  For this API, @flags should not contain either
> +- * VIR_DOMAIN_XML_INACTIVE or VIR_DOMAIN_XML_UPDATE_CPU.
> ++ * VIR_DOMAIN_XML_SECURE.
> +  *
> +  * Returns a 0 terminated UTF-8 encoded XML instance, or NULL in case of
> +  * error.  The caller must free() the returned value.
> +@@ -1091,12 +1089,7 @@ virDomainSaveImageGetXMLDesc(virConnectP
> + 
> +     virCheckConnectReturn(conn, NULL);
> +     virCheckNonNullArgGoto(file, error);
> +-
> +-    if ((conn->flags & VIR_CONNECT_RO) && (flags & VIR_DOMAIN_XML_SECURE)) {
> +-        virReportError(VIR_ERR_OPERATION_DENIED, "%s",
> +-                       _("virDomainSaveImageGetXMLDesc with secure flag"));
> +-        goto error;
> +-    }
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->domainSaveImageGetXMLDesc) {
> +         char *ret;
> +Index: libvirt-4.7.0/src/qemu/qemu_driver.c
> +===================================================================
> +--- libvirt-4.7.0.orig/src/qemu/qemu_driver.c
> ++++ libvirt-4.7.0/src/qemu/qemu_driver.c
> +@@ -6791,7 +6791,7 @@ qemuDomainSaveImageGetXMLDesc(virConnect
> +     if (fd < 0)
> +         goto cleanup;
> + 
> +-    if (virDomainSaveImageGetXMLDescEnsureACL(conn, def, flags) < 0)
> ++    if (virDomainSaveImageGetXMLDescEnsureACL(conn, def) < 0)
> +         goto cleanup;
> + 
> +     ret = qemuDomainDefFormatXML(driver, def, flags);
> +Index: libvirt-4.7.0/src/remote/remote_protocol.x
> +===================================================================
> +--- libvirt-4.7.0.orig/src/remote/remote_protocol.x
> ++++ libvirt-4.7.0/src/remote/remote_protocol.x
> +@@ -5226,8 +5226,7 @@ enum remote_procedure {
> +     /**
> +      * @generate: both
> +      * @priority: high
> +-     * @acl: domain:read
> +-     * @acl: domain:read_secure:VIR_DOMAIN_XML_SECURE
> ++     * @acl: domain:write
> +      */
> +     REMOTE_PROC_DOMAIN_SAVE_IMAGE_GET_XML_DESC = 235,
> + 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10166.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10166.patch
> new file mode 100644
> index 0000000..12ab543
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10166.patch
> @@ -0,0 +1,43 @@
> +From 6da721ea37bf3624ff9922637cfa657d2dcb20f9 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 09:14:53 +0200
> +Subject: [PATCH 09/11] api: disallow virDomainManagedSaveDefineXML on
> + read-only connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virDomainManagedSaveDefineXML can be used to alter the domain's
> +config used for managedsave or even execute arbitrary emulator binaries.
> +Forbid it on read-only connections.
> +
> +Fixes: CVE-2019-10166
> +Reported-by: Matthias Gerstner <mgerstner@suse.de>
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit db0b78457f183e4c7ac45bc94de86044a1e2056a)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10166
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/libvirt-domain.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/libvirt-domain.c b/src/libvirt-domain.c
> +index 270e10e..5c764aa 100644
> +--- a/src/libvirt-domain.c
> ++++ b/src/libvirt-domain.c
> +@@ -9482,6 +9482,7 @@ virDomainManagedSaveDefineXML(virDomainPtr domain, const char *dxml,
> + 
> +     virCheckDomainReturn(domain, -1);
> +     conn = domain->conn;
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->domainManagedSaveDefineXML) {
> +         int ret;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10167.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10167.patch
> new file mode 100644
> index 0000000..576f46c
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10167.patch
> @@ -0,0 +1,41 @@
> +From 5441f05a42a90779b0df86518286bf527e94aafb Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 09:16:14 +0200
> +Subject: [PATCH 10/11] api: disallow virConnectGetDomainCapabilities on
> + read-only connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This API can be used to execute arbitrary emulators.
> +Forbid it on read-only connections.
> +
> +Fixes: CVE-2019-10167
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit 8afa68bac0cf99d1f8aaa6566685c43c22622f26)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10167
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/libvirt-domain.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/libvirt-domain.c b/src/libvirt-domain.c
> +index 5c764aa..9862a5d 100644
> +--- a/src/libvirt-domain.c
> ++++ b/src/libvirt-domain.c
> +@@ -11274,6 +11274,7 @@ virConnectGetDomainCapabilities(virConnectPtr conn,
> +     virResetLastError();
> + 
> +     virCheckConnectReturn(conn, NULL);
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->connectGetDomainCapabilities) {
> +         char *ret;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10168.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10168.patch
> new file mode 100644
> index 0000000..16f1a6d
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10168.patch
> @@ -0,0 +1,49 @@
> +From f5ace9c05d59b70d4899199a187cb32ec6f600d8 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 09:17:39 +0200
> +Subject: [PATCH 11/11] api: disallow virConnect*HypervisorCPU on read-only
> + connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +These APIs can be used to execute arbitrary emulators.
> +Forbid them on read-only connections.
> +
> +Fixes: CVE-2019-10168
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit bf6c2830b6c338b1f5699b095df36f374777b291)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10168
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/libvirt-host.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/libvirt-host.c b/src/libvirt-host.c
> +index e20d6ee..2978825 100644
> +--- a/src/libvirt-host.c
> ++++ b/src/libvirt-host.c
> +@@ -1041,6 +1041,7 @@ virConnectCompareHypervisorCPU(virConnectPtr conn,
> + 
> +     virCheckConnectReturn(conn, VIR_CPU_COMPARE_ERROR);
> +     virCheckNonNullArgGoto(xmlCPU, error);
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->connectCompareHypervisorCPU) {
> +         int ret;
> +@@ -1234,6 +1235,7 @@ virConnectBaselineHypervisorCPU(virConnectPtr conn,
> + 
> +     virCheckConnectReturn(conn, NULL);
> +     virCheckNonNullArgGoto(xmlCPUs, error);
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->connectBaselineHypervisorCPU) {
> +         char *cpu;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
> index 270dc72..1d3b48e 100644
> --- a/recipes-extended/libvirt/libvirt_4.7.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
> @@ -37,6 +37,17 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
>             file://lxc_monitor-Avoid-AB-BA-lock-race.patch \
>             file://CVE-2019-3840.patch \
> +           file://0001-cpu_x86-Do-not-cache-microcode-version.patch \
> +           file://0002-qemu-Don-t-cache-microcode-version.patch \
> +           file://CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p1.patch \
> +           file://CVE-2018-12126_CVE-2018-12127_CVE-2018-12130_CVE-2019-11091_p2.patch \
> +           file://CVE-2019-10132_p1.patch \
> +           file://CVE-2019-10132_p2.patch \
> +           file://CVE-2019-10132_p3.patch \
> +           file://CVE-2019-10161.patch \
> +           file://CVE-2019-10166.patch \
> +           file://CVE-2019-10167.patch \
> +           file://CVE-2019-10168.patch \
>            "
>  
>  SRC_URI[libvirt.md5sum] = "38da6c33250dcbc0a6d68de5c758262b"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

