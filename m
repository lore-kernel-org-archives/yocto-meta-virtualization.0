Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 142BDE00D46; Mon,  3 Jun 2019 13:06:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F58DE00D38
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Jun 2019 13:06:41 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id r76so17453881lja.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 03 Jun 2019 13:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cg2KpzjWrkY7/IgTtprE82mlv6EuqrQaa7QkDHn8efI=;
	b=FQdVElzPNra7irBH2ZK3Tjel55pKlS84ig1eEa10GGhsu5lDVmwxWVyT7F8CN5SaTV
	p1SqVOdm82C+N3K3lHRrNpgNDQZu6X/lewxRdE9Gz8rFHEkydSX5iYZU8l9trNpKxprU
	aWqz89SxVFeCFlKx3SVhQxSTlBCVFCTjdZBvVCbHqrUlAU2Rbk71ZwdrGnNTq9XGprM/
	+wZlllxWBFPpErv1sAcdiJcwXKKXrkKgtVayr3YyC9yn6nM3sU5UPNrgegn7fLIWLEqZ
	KXXPQnCPHyRbewT4llKiekGqgMmjinF1Dj+b5x+gJVAtkPvOYRQPgZAPH5vMtT8SK+zd
	xNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cg2KpzjWrkY7/IgTtprE82mlv6EuqrQaa7QkDHn8efI=;
	b=QqCUHTo8RWJiGZTC80BUNnB3eo4lrr+bDLnwK4pYapBwfJKKvm7YoMsYX2xUwinBfF
	CwulthpWb4t5GIPSv2biKFOBZhpIxq9QC3yOF0yeIEAjubxQNv/8CBNjRbrtHhPZzxJk
	Qqbxm23ChgfGGdF8Hx8b78XuLhYA1LI0HpvALDO9YQOaBhXedlxzCBY0uQEAxcTKADx/
	eeH2bVxRWMCDCUTSng/ZQnJxuyBdM6HkuqodMQt10y7ngmyj7D3opTFyK3MKJFfevAtT
	GNis4Z7cbJc7ecS6qZbCZGUaXIPTJZApn2+0DKlU7sVgNjW1pnTWuxpThxjfzjnDGH15
	/CUw==
X-Gm-Message-State: APjAAAWrz5SwfLH7Ni/hisyngWQKcvAsCnZWgEJ2eQ2qFYPFVYXUHdhs
	x2SJWY6NpBbzAYaKM2iU3si6MsWhfjaXOkhVCyajk9du
X-Google-Smtp-Source: APXvYqwFWYUkn6GcZi+ygoiCOZIMbBO0q/I4FDCkf5a1iFvbzIKeyG3oBkg1pPF1Lnc8pZAky5v4ysG6CkELy9mQQDA=
X-Received: by 2002:a2e:868f:: with SMTP id l15mr9050298lji.118.1559592400346; 
	Mon, 03 Jun 2019 13:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <1559366092-20428-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1559366092-20428-1-git-send-email-akuster808@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Jun 2019 16:06:29 -0400
Message-ID: <CADkTA4Mss7DJA7r4GrjR99X_FYB=QdRLrt2Vx6wLbFGt8dHqog@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [thud][PATCH] libvirt: Security fix CVE-2019-3840
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
X-List-Received-Date: Mon, 03 Jun 2019 20:06:45 -0000
Content-Type: text/plain; charset="UTF-8"

merged to thud.

Bruce

On Sat, Jun 1, 2019 at 1:15 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Armin Kuster <akuster@mvista.com>
>
> Source: https://libvirt.org
> MR: 97512
> Type: Security Fix
> Disposition: Backport from https://libvirt.org/git/?p=libvirt.git;a=commitdiff;h=9ed175fbc2deecfdaeabca7bc77c7e7ae33a3377
> ChangeID: 6c662c67dd3cf6e0eba493b7b619db35f2e07d93
> Description:
>
> Fixes CVE-2019-3840
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../libvirt/libvirt/CVE-2019-3840.patch            | 39 ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_4.7.0.bb          |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-3840.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-3840.patch b/recipes-extended/libvirt/libvirt/CVE-2019-3840.patch
> new file mode 100644
> index 0000000..8cca821
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-3840.patch
> @@ -0,0 +1,39 @@
> +From 9ed175fbc2deecfdaeabca7bc77c7e7ae33a3377 Mon Sep 17 00:00:00 2001
> +From: John Ferlan <jferlan@redhat.com>
> +Date: Fri, 7 Sep 2018 16:01:27 -0400
> +Subject: [PATCH] qemu: Remove duplicated qemuAgentCheckError
> +
> +Commit 5b3492fadb moved qemuAgentCheckError calls into
> +qemuAgentCommand for various reasons; however, subsequent
> +commit 0977b8aa0 adding a new command made call again
> +So let's just remove the duplicitous call from
> +qemuAgentGetInterfaces.
> +
> +Signed-off-by: John Ferlan <jferlan@redhat.com>
> +ACKed-by: Michal Privoznik <mprivozn@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-3840
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/qemu/qemu_agent.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +Index: libvirt-4.7.0/src/qemu/qemu_agent.c
> +===================================================================
> +--- libvirt-4.7.0.orig/src/qemu/qemu_agent.c
> ++++ libvirt-4.7.0/src/qemu/qemu_agent.c
> +@@ -1987,10 +1987,9 @@ qemuAgentGetInterfaces(qemuAgentPtr mon,
> +     if (!(cmd = qemuAgentMakeCommand("guest-network-get-interfaces", NULL)))
> +         goto cleanup;
> +
> +-    if (qemuAgentCommand(mon, cmd, &reply, false, VIR_DOMAIN_QEMU_AGENT_COMMAND_BLOCK) < 0 ||
> +-        qemuAgentCheckError(cmd, reply) < 0) {
> ++    if (qemuAgentCommand(mon, cmd, &reply, false,
> ++                         VIR_DOMAIN_QEMU_AGENT_COMMAND_BLOCK) < 0)
> +         goto cleanup;
> +-    }
> +
> +     if (!(ret_array = virJSONValueObjectGet(reply, "return"))) {
> +         virReportError(VIR_ERR_INTERNAL_ERROR, "%s",
> diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
> index 5136798..270dc72 100644
> --- a/recipes-extended/libvirt/libvirt_4.7.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
> @@ -36,6 +36,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
>             file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
>             file://lxc_monitor-Avoid-AB-BA-lock-race.patch \
> +           file://CVE-2019-3840.patch \
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

