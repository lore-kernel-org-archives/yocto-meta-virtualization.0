Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C355BE00B65; Tue, 17 Apr 2018 10:59:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C071E006B4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Apr 2018 10:59:15 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id i18-v6so13616489lfc.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Apr 2018 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NqkIql3ib1cV/JXIFbHq52yZmhwe8pBmrB/1qiGfLWA=;
	b=qxnjwEI18Zm+8rIoU0wIrxJS18eNItKpKV10QCWDPuj6pviE0RChZq0Pq4BGRYh2td
	H30fw+iFCAAUqC8EN5df1eBgexJyJbgIJUP1Qa1xuYh0JhpJe6F5I/nvLQ/ISQCnHRGF
	A/X2l5fOi08SJe3EXLXjfzkwZUcV+eWOEBhcPyJcFNYOvp4zDh0uAu32XSA5aY0RHEul
	xihfWcMnxFWnhjGxK/418EMqi89gwF3R1Mr8zkLiiqiF1wOz7PoaEW4Gz0kDTtGyjR5D
	2jrFA85IyGn0g/O3tknDAx9avXNFFyG0ZzaWqTc/86sUSbSjZufmtkPlBXIQFxQdOocG
	sJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NqkIql3ib1cV/JXIFbHq52yZmhwe8pBmrB/1qiGfLWA=;
	b=NvhMKIfXjzweqYr+d7yVf0JjSt9vmVIOvVXxZc5cBugjF9oKTuT56W9I8vkuLVXdWO
	nZIXCe1Z1InCFjKXc9wqRYWza2vr/y+7Zmf8TjURc05547ImiE5RptTwWwKL6d+mYcHK
	yuVjVc7q8DjXtBvTZ3WE6SJQWew0+FtDcD5JUcCD84YhMQIPpebFpfHGtsVvVX1ULNd+
	3UV5a2svVw5RCcc19vTo1K2MrIX9FwrtZ18hYto1w6zR5gu03bKvSdZG5WM7+bHWp2p7
	tPRhto4ydPfZvNoz1J3hsPPLMbZeRQEVdo4fOTDiq1zZx4Kp/G4VY/1N73CLBdGaJtpn
	2V2g==
X-Gm-Message-State: ALQs6tAdP78F2ekNECWx9HJxxC0tqCH+IVl8KegbqyFg0VcGjTHwIlhm
	KmwGuu7Nuyp+eIUE33B7K/WO9ikDmA92avQocvCabMv4
X-Google-Smtp-Source: AIpwx49422LrSDQuxe9MaHY/CmpRLmIMC4a2TYsDMAhk29ETsb8gDr/YuMLYX0AD5VJaqsV5V/yLf8OsDW9Z2NTsDkM=
X-Received: by 10.46.155.79 with SMTP id o15mr2128793ljj.49.1523987954043;
	Tue, 17 Apr 2018 10:59:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.22 with HTTP; Tue, 17 Apr 2018 10:59:13 -0700 (PDT)
In-Reply-To: <1523909387-12263-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
References: <1523909387-12263-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Apr 2018 13:59:13 -0400
Message-ID: <CADkTA4OMw=C7OGq=0dwpAS4k-eKd7LwVe_Xzoq9am0Y8gaKKjg@mail.gmail.com>
To: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
Cc: Cyril Chemparathy <cyril.chemparathy@xilinx.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v3] inittab: fix hypervisor console
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
X-List-Received-Date: Tue, 17 Apr 2018 17:59:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 16, 2018 at 4:09 PM, Bhargava Sreekantappa Gayathri
<bhargava.sreekantappa-gayathri@xilinx.com> wrote:
> From: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
>
> This commit switches over to using existing SERIAL_CONSOLES mechanism
> for hvc0 inittab entry generation.  This then results in
> /bin/start_getty wrapper being used, which avoids the getty failure seen
> when running a xen capable rootfs natively on linux.
>
> Signed-off-by: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-gayathri@xilinx.com>
> ---
> Change log:
> v2: Fixed whitespace trashing in our email system which was causing the patch
>         to not apply


Are you sure about this ?

yow-bashfiel-d4 [/home/bruc...ualization]> git am -s hv.mbox
Applying: inittab: fix hypervisor console
error: patch failed: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend:1
error: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend: patch does not apply
Patch failed at 0001 inittab: fix hypervisor console
The copy of the patch that failed is found in:
   /home/bruce/poky/meta-virtualization/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Bruce

>
> v3: Update patch author
>
>  conf/distro/include/virt_console.inc                | 1 +
>  conf/layer.conf                                     | 3 +++
>  recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend | 6 ------
>  3 files changed, 4 insertions(+), 6 deletions(-)
>  create mode 100644 conf/distro/include/virt_console.inc
>  delete mode 100644 recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>
> diff --git a/conf/distro/include/virt_console.inc b/conf/distro/include/virt_console.inc
> new file mode 100644
> index 0000000..4d56806
> --- /dev/null
> +++ b/conf/distro/include/virt_console.inc
> @@ -0,0 +1 @@
> +SERIAL_CONSOLES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' 115200;hvc0', '', d)}"
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 4233d39..bfc47ff 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -20,6 +20,9 @@ LAYERDEPENDS_virtualization-layer = "core networking-layer"
>  # Override security flags
>  require conf/distro/include/virt_security_flags.inc
>
> +# Add hypervisor console
> +require conf/distro/include/virt_console.inc
> +
>  PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
>  PREFERRED_PROVIDER_virtual/containerd ?= "containerd-opencontainers"
>
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> deleted file mode 100644
> index 1b89aec..0000000
> --- a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -do_install_append() {
> -       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
> -               echo "" >> ${D}${sysconfdir}/inittab
> -               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
> -       fi
> -}
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

