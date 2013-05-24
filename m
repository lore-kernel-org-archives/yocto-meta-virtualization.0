Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38482E014E9
	for <meta-virtualization@lists.yoctoproject.org>;
	Fri, 24 May 2013 09:35:57 -0700 (PDT)
Received: by mail-la0-f54.google.com with SMTP id eg20so4707786lab.13
	for <meta-virtualization@lists.yoctoproject.org>;
	Fri, 24 May 2013 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CEngJt2vqUxjl9OohGiGyzayk6f+MxujCS6BSZAJPsM=;
	b=GHoG/2LY5hRamrm8C/e1Y+FKSxUOiO32s7Up5i7WP7VCiVfI9kLKw6MqByhcURaM2n
	j7obqfV2jOud0ohJmTtdpVBmb39baQkRdxYuMOU1acPVqaYgNJeOkI0BvDvJned1J/MJ
	wxfPQy1EjquJ19gsknukgYUh5hwQgPWeEE/4PCx8k9SpiV3U5ARfodDQLiiGlN7s1hu9
	wqnjPlTnA+Z1eIrjmKMHWBmKkc/0fLSKpz6avoEkjSIJWGWp9cWqtPh5o7K5TieKfoZs
	6LCOcDwUS7z+WsEF8Sd5wLj8FVra76Jsag2ho7jlKZu2TbxExsz2bMR5c9zmmd6i4BOl
	CLaw==
MIME-Version: 1.0
X-Received: by 10.152.87.116 with SMTP id w20mr9411779laz.0.1369413355789;
	Fri, 24 May 2013 09:35:55 -0700 (PDT)
Received: by 10.112.166.100 with HTTP; Fri, 24 May 2013 09:35:55 -0700 (PDT)
In-Reply-To: <1369405476-13592-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1369405476-13592-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Fri, 24 May 2013 12:35:55 -0400
Message-ID: <CADkTA4PS2kersyh803EbZzba8vh7eHbSZJ2GB5zjXmVeBAk7Cg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: Bogdan Purcareata <bogdan.purcareata@freescale.net>,
	meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] libvirt: add patch to fix thread safety in lxc callback
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
X-List-Received-Date: Fri, 24 May 2013 16:35:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 24, 2013 at 10:24 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> From: Bogdan Purcareata <bogdan.purcareata@freescale.net>
>
> Patch has been submitted upstream (22 mar 2013) after the release of
> Libvirt 1.0.3 (5 mar 2013). Updated to work against libvirt 1.0.3.
> Please see http://www.redhat.com/archives/libvir-list/2013-March/msg01353.html
> for original patch.

Good information in the commit log. We'll have to bump our libvirt
version soon, but
we can merge this for now, and drop it on that update.

I've staged the change.

Bruce

>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.net>
> ---
>  ...ix-thread-safety-in-lxc-callback-handling.patch | 63 ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.0.3.bb          |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch b/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
> new file mode 100644
> index 0000000..558d5ef
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
> @@ -0,0 +1,63 @@
> +From ad5d9cee87357f9f38f62583119606ef95ba10df Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Fri, 24 May 2013 16:46:00 +0300
> +Subject: [PATCH] Fix thread safety in LXC callback handling
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +---
> + src/lxc/lxc_process.c | 18 +++++++++++++++++-
> + 1 file changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/lxc_process.c b/src/lxc/lxc_process.c
> +index aaa81a7..0eadc67 100644
> +--- a/src/lxc/lxc_process.c
> ++++ b/src/lxc/lxc_process.c
> +@@ -609,8 +609,13 @@ static void virLXCProcessMonitorExitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
> +                                            virLXCProtocolExitStatus status,
> +                                            virDomainObjPtr vm)
> + {
> ++    virLXCDriverPtr driver = lxc_driver;
> +     virLXCDomainObjPrivatePtr priv = vm->privateData;
> +
> ++    lxcDriverLock(driver);
> ++    virObjectLock(vm);
> ++    lxcDriverUnlock(driver);
> ++
> +     switch (status) {
> +     case VIR_LXC_PROTOCOL_EXIT_STATUS_SHUTDOWN:
> +         priv->stopReason = VIR_DOMAIN_EVENT_STOPPED_SHUTDOWN;
> +@@ -628,6 +633,8 @@ static void virLXCProcessMonitorExitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
> +     }
> +     VIR_DEBUG("Domain shutoff reason %d (from status %d)",
> +               priv->stopReason, status);
> ++
> ++    virObjectUnlock(vm);
> + }
> +
> + /* XXX a little evil */
> +@@ -636,12 +643,21 @@ static void virLXCProcessMonitorInitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
> +                                            pid_t initpid,
> +                                            virDomainObjPtr vm)
> + {
> +-    virLXCDomainObjPrivatePtr priv = vm->privateData;
> ++    virLXCDriverPtr driver = lxc_driver;
> ++    virLXCDomainObjPrivatePtr priv;
> ++
> ++    lxcDriverLock(driver);
> ++    virObjectLock(vm);
> ++    lxcDriverUnlock(driver);
> ++
> ++    priv = vm->privateData;
> +     priv->initpid = initpid;
> +     virDomainAuditInit(vm, initpid);
> +
> +     if (virDomainSaveStatus(lxc_driver->caps, lxc_driver->stateDir, vm) < 0)
> +         VIR_WARN("Cannot update XML with PID for LXC %s", vm->def->name);
> ++
> ++    virObjectUnlock(vm);
> + }
> +
> + static virLXCMonitorCallbacks monitorCallbacks = {
> +--
> +1.7.11.7
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index 0364421..9a828b1 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -19,6 +19,7 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>  RCONFLICTS_${PN}_libvirtd = "connman"
>
>  SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
> +  file://libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch \
>         file://libvirtd.sh \
>         file://libvirtd.conf"
>
> --
> 1.7.11.7
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

