Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8BFEE00AB6; Mon, 24 Apr 2017 09:46:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80A0AE00839
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 09:46:56 -0700 (PDT)
Received: by mail-yb0-f195.google.com with SMTP id 19so9177168ybl.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nwive84ML4qZX4WgCj0c3yLcNASY0MhyR8ct0HlwybI=;
	b=Kxh8QVKfu7KZyFSlPSJ8BLqLaQLOvC/1r8qeyEOA2FZHxz7I/9DC79lmz7hD3Aaa67
	j/GPQXRxeFvTgtBzd/yYsC8wdJTlHK4oUtVJEQrsosxSrxwF7H/EiXoCfBchqwtF+THh
	8Cjh4fOtyDsmNMHzZupoKqpOnhTJGFkThkFpjpE1lZ255JRTC+LAPUbF/mam3xTuqPdY
	OL+ifg2SX82bISRRTe2sThp52oZLIWHs8di43h0voNuyn+l9ipvaiyOQ/kdXhdl+7ASt
	B4dYOOk7mEzQgoxYYasOqNc868sGXFmZ5jrios1mQtkNfbnq3OQuS39WLhPDhl1aErZx
	+c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=nwive84ML4qZX4WgCj0c3yLcNASY0MhyR8ct0HlwybI=;
	b=XYyTMwisopwXniTKKHKWPlfscKbu3LJB2An0OVjpBRiWxnBeHDJGNVBv33d89SmV77
	a/Np4MvGdUWAmivMFJs4KsCJA1n3yWLSFihsjH9Cuz4EbrQipBYubAcxbQA72AAMRdu+
	PG2sCKmjFoKLgqPnuJ9WXHJOnSktetV0giOUR8iXAhArCpcLpkL86e8ODLHNBLtfM6vV
	yacthQ0S5lCi5+DNSejJE6hKIxiwpjBwRMn/vnAS7rDr9CSLXMsBt4in7MO26lLooE//
	9JolFPoOXR8WZXZ2bHFHyo4EutnFFPA33uPkKanM4CVdv66WATH/FBFdgaBW0cZnZTmx
	5O/A==
X-Gm-Message-State: AN3rC/5BweKGA3RMhcAO6fViqCb0jFD0pgu4mT3surTntr2HbjP2Jznf
	fXPjQaYpyi0fnItsryBp8Y8SoYu6Bw==
X-Received: by 10.37.173.146 with SMTP id z18mr5875660ybi.96.1493052416046;
	Mon, 24 Apr 2017 09:46:56 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.165.4 with HTTP; Mon, 24 Apr 2017 09:46:55 -0700 (PDT)
In-Reply-To: <CADM9VcsY1xjqGuuzH_=Kky3wP8aB3Cj1gBbtcPHKPRp3TwiO4A@mail.gmail.com>
References: <CADM9VcsY1xjqGuuzH_=Kky3wP8aB3Cj1gBbtcPHKPRp3TwiO4A@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 24 Apr 2017 12:46:55 -0400
X-Google-Sender-Auth: 6EWCzKnlKl9Q5jK8OYWVcbZdZvE
Message-ID: <CAPuovEKxpUZsPZ5LknxfisUF59S6BpVAqLj9SHPReo=_xOg+Og@mail.gmail.com>
To: Massimiliano Malisan <max.malisan.uk@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Problems building criu recipe for morty
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
X-List-Received-Date: Mon, 24 Apr 2017 16:47:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 18, 2017 at 4:05 AM, Massimiliano Malisan
<max.malisan.uk@gmail.com> wrote:
> Hi all,
>
> Forewords:
> * I am learning to use Yocto, so maybe I am missing something that should be
> obvious..
> * I do not have any selinux support in my configuration as I don't need it
> atm (and I suppose it isn't necessary, otherwise it should be in the
> dependency list of the layer).
> * The system I am building for uses sysvinit and not systemd as init (just
> mentioning due to the systemd-related warning in the second problem, which I
> deem unrelated to the error I get..).
>
> I've been trying to build the criu recipe for morty (I have all
> repositories: poky, meta-openembedded, meta-intel (I have a x86_64 Intel
> CPU) and meta-virtualization - on morty branch) but I have some issues:
>
> 1) If I run the recipe "as is" I get the following error:
>
> ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_patch: Command Error: 'quilt
> --quiltrc
> /opt/yocto/virt-builder/meta-virt-builder/tmp/sysroots/x86_64-linux/etc/quiltrc
> push' exited with 0  Output:


I can confirm this issue. Possibly broken for some time now and nobody
noticed. At any rate keep an eye out on the list I will try to get a
fix sent.

Mark

> Applying patch disable-selinux.patch
> can't find file to patch at input line 15
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |Upstream-Status: Inappropriate [disable feature]
> |
> |It shows warning when build crius if libselinux has been built already:
> |
> |  WARNING: QA Issue: criu rdepends on libselinux, but it isn't a build
> dependency? [build-deps]
> |
> |Apply this patch to disable selinux support when 'selinux' is not in
> PACKAGECONF.
> |
> |Signed-off-by: Kai Kang <kai.kang@windriver.com>
> |
> |diff --git a/Makefile.config b/Makefile.config
> |index ce4b8d8..3ac2780 100644
> |--- a/Makefile.config
> |+++ b/Makefile.config
> --------------------------
> No file to patch.  Skipping patch.
> 1 out of 1 hunk ignored
> Patch disable-selinux.patch does not apply (enforce with -f)
> ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_patch: Function failed:
> patch_do_patch
> ERROR: Logfile of failure stored in:
> /opt/yocto/virt-builder/meta-virt-builder/tmp/work/corei7-64-poky-linux/criu/2.5+gitAUTOINC+c031417255-r0/temp/log.do_patch.24372
> ERROR: Task
> (/opt/yocto/repository/meta-virtualization/recipes-containers/criu/criu_git.bb:do_patch)
> failed with exit code '1'
>
>
> 2) If I remove the patch reference from the recipe the compilation seems run
> fine but in the end I get this error:
>
> ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: QA Issue: criu: The
> compile log indicates that host include and/or library paths were used.
>          Please check the log
> '/opt/yocto/virt-builder/meta-virt-builder/tmp/work/corei7-64-poky-linux/criu/2.5+gitAUTOINC+c031417255-r0/temp/log.do_compile'
> for more information. [compile-host-path]
> WARNING: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: QA Issue:
> /usr/libexec/criu/scripts/systemd-autofs-restart.sh contained in package
> criu requires /bin/bash, but no providers found in RDEPENDS_criu?
> [file-rdeps]
> ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: QA run found fatal
> errors. Please consider fixing them.
> ERROR: criu-2.5+gitAUTOINC+c031417255-r0 do_package_qa: Function failed:
> do_package_qa
> ERROR: Logfile of failure stored in:
> /opt/yocto/virt-builder/meta-virt-builder/tmp/work/corei7-64-poky-linux/criu/2.5+gitAUTOINC+c031417255-r0/temp/log.do_package_qa.27615
> ERROR: Task
> (/opt/yocto/repository/meta-virtualization/recipes-containers/criu/criu_git.bb:do_package_qa)
> failed with exit code '1'
>
>
> Any idea on how to solve this?
>
> Best regards,
>     Max
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

