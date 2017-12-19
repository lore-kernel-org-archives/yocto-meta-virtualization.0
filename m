Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D3A2E00D6A; Mon, 18 Dec 2017 19:14:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAC13E00CFF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Dec 2017 19:14:50 -0800 (PST)
Received: by mail-yb0-f194.google.com with SMTP id o84so5915991yba.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Dec 2017 19:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EuMaygPjeyk3BDGSv1byzLpzvJyEEp8depbUnvikwfY=;
	b=NeAw/9HK31qEfLLHouz3uqber3XqGobOlL1sfACThBydHZMnUiFvmTekbRFH2rSP78
	oX5ioKBFPYANIXKt4m4n5Tgsx3LuVtWmI74nBuL1BmTXI3iSfqO75Fq5tDXrbu4bmqmC
	oJfxC29U+CKxUk2xGwmNOlDTpqud175nOwHmk8UDfIErxBJAOkDJVXiOU/hQCaDpLR8I
	0M9sgJwXomF0Y7047kDBh/lw/lW0YiG1bAjdydFZOa+RJOxF6pz3BVWmXweiVFVd4hOO
	4tZjtlfoCEm+EAM+7sjfFxv/rCcI7kEGeHGiziUzTWhRuQenEgNGXa0MPKUYWlDGYk5P
	JoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=EuMaygPjeyk3BDGSv1byzLpzvJyEEp8depbUnvikwfY=;
	b=onWx+6A33fQmmz0AR0zY/lYR6gQ+I44gTlt59pgdOSYNcSoGyBA4IG8kNKQ51eCY/h
	FaSJWZ4zL+Ef2TTsFQ3AmCj5KfubwxYKE6fE4Y0xVBtKphjDY3nOuJX/jounib+q1Pfr
	JEwU7HYiYkk+2IyYQvXJFDg7xrRdDF7B54eZybYr8ArD84AlFNev3GnveAlZmZTtYZnN
	JPQjxUXszF7rrhMUNeZc62NtWHugXFbiiURjdZeQD6KhA5cRlURKZT5ju82YoYo5kZbG
	Dwjp3J6xs2nzcCKjtCceyV0cd/WEFU24WXdxAakUeTbxwDQ9JpcmMideBi9ysO7/2O8p
	WRIA==
X-Gm-Message-State: AKGB3mLpAfditFMiIhc5W/LoHM2NcvMd2NZWjl9j97xioGgAylTMBUM5
	/za0+VRpuZtDynaEIm4eH0WlMqxrZ6PmAyIiPEH6c2am
X-Google-Smtp-Source: ACJfBovZ+wVmq0FBuFGKEuYS6RO1h+BxIv0SCghLQiuBSgrok3VRcHEf6On+mfQWG1BgghodydlquU5YkXQ4/EB6RDo=
X-Received: by 10.37.239.69 with SMTP id w5mr1560437ybm.31.1513653289734; Mon,
	18 Dec 2017 19:14:49 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.189.69 with HTTP; Mon, 18 Dec 2017 19:14:49 -0800 (PST)
In-Reply-To: <1513648689-92598-1-git-send-email-haitao.liu@windriver.com>
References: <1513648689-92598-1-git-send-email-haitao.liu@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Dec 2017 22:14:49 -0500
X-Google-Sender-Auth: SQxlVw_neW6mjDXlouFrx3Ckous
Message-ID: <CAPuovEKHtgbGtKDiogu6u1wp1Ct5h=36G_T6rrSpC1LzfXvkbw@mail.gmail.com>
To: Liu Haitao <haitao.liu@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: Disable the bind-interfaces for lxc.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2017 03:14:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 18, 2017 at 8:58 PM, Liu Haitao <haitao.liu@windriver.com> wrote:
> When enable lxc service it failed with the following errors:
>
> """
> root@intel-x86-64:~# /usr/libexec/lxc/lxc-net start
>
>      dnsmasq: cannot set --bind-interfaces and --bind-dynamic
>      Failed to setup lxc-net.
> """
>
> It said that the "bind-interfaces" and "bind-dynamic" cannot cooperate together.
> These two options have the same fundamental capacity of binding network interfaces.
>
> So dnsmasq just require one of this kind of option.
>
> For some reason ,the following commit  compulsively add the "bind-dynamic" option
> for dnsamsq.
>
> """
>         c3c4d977cbb51363f9030c2e39d56a772b29f73b
> """

It is not for "some reason", it is for a specific reason that is
explained in detail in the commit log and in the comment that goes
with the setting. Libvirt will have issues setting up virbr0 if we do
not use 'bind-dynamic'.

Now you aren't touching the dnsmasq.conf file which is good since you
will not be breaking libvirt with this change but I will have to take
a closer look at your approach to see if it valid for lxc-net. Really
we should move the 'bind-dynamic' into a libvirt specific
sub-configuration file in /etc/dnsmasq.d/, so something like
/etc/dnsmasq.d/libvirt.conf, and then have another one for lxc
(/etc/dnsmasq.d/lxc.conf). The main dnsmasq.conf file should be empty.
But again I need to dig around a bit to remind myself of how things
work.

Did you do any testing other than lxc-net starting? did you validate
the dnsmasq functions on the lxcbr0 that is bound to the new instance
of dnsmasq?

MarkA

>
> So we just remove 'bind-interfaces' in lxc service scripts.
>
> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> ---
>  ...1-lxc-Disable-the-bind-interfaces-for-lxc.patch | 45 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_2.0.8.bb                |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
>
> diff --git a/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
> new file mode 100644
> index 0000000..fec6843
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-lxc-Disable-the-bind-interfaces-for-lxc.patch
> @@ -0,0 +1,45 @@
> +From 76533652915dcca2ce4265b320fd1c20a75adff8 Mon Sep 17 00:00:00 2001
> +From: Liu Haitao <haitao.liu@windriver.com>
> +Date: Sun, 17 Dec 2017 23:02:13 -0800
> +Subject: [PATCH] lxc: Disable the bind-interfaces for lxc.
> +
> +When enable lxc service it failed with the following errors:
> +"""
> +    dnsmasq: cannot set --bind-interfaces and --bind-dynamic
> +    Failed to setup lxc-net.
> +"""
> +It said that the "bind-interfaces" and "bind-dynamic" cannot
> +cooperate together.
> +These two options have the same fundamental capacity of binding
> +network interfaces.
> +So dnsmasq just require one of this kind of option.
> +For some reason ,the following commit  compulsively add the "bind-dynamic" option
> +for dnsamsq.
> +"""
> +       c3c4d977cbb51363f9030c2e39d56a772b29f73b
> +"""
> +So we just remove 'bind-interfaces' in lxc service scripts.
> +
> +Upstream-Status: Inappropiate [Modify configuration]
> +
> +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> +---
> + config/init/common/lxc-net.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/init/common/lxc-net.in b/config/init/common/lxc-net.in
> +index f770950f..6f45228d 100644
> +--- a/config/init/common/lxc-net.in
> ++++ b/config/init/common/lxc-net.in
> +@@ -128,7 +128,7 @@ start() {
> +     done
> +
> +     dnsmasq $LXC_DHCP_CONFILE_ARG $LXC_DOMAIN_ARG -u ${DNSMASQ_USER} \
> +-            --strict-order --bind-interfaces --pid-file="${varrun}"/dnsmasq.pid \
> ++            --strict-order --pid-file="${varrun}"/dnsmasq.pid \
> +             --listen-address ${LXC_ADDR} --dhcp-range ${LXC_DHCP_RANGE} \
> +             --dhcp-lease-max=${LXC_DHCP_MAX} --dhcp-no-override \
> +             --except-interface=lo --interface=${LXC_BRIDGE} \
> +--
> +2.11.0
> +
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
> index c9ce5f0..5267bf7 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -36,6 +36,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
>         file://cgroups-work-around-issue-in-gcc-7.patch \
> +       file://0001-lxc-Disable-the-bind-interfaces-for-lxc.patch \
>         "
>
>  SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

