Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B43F3E008E0; Thu,  2 Aug 2018 19:59:16 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D97DE0073D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Aug 2018 19:59:16 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id y17-v6so3679669ljy.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Aug 2018 19:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uenJUbt3GrrQe7B3YYNLTOUmwO2JFKqzIHqpBxgtBAQ=;
	b=EtS5gpcqQAmv88TipT/dJd9v5qdwuwG7G8a+f0bqyvJ3xzYVeGFv4iWNl4jqFmKM0Z
	MuOJkucgz58lf59DG7liEj6f4o0LYRkABl5YC/xrv8+reDOPJWdg/8kdGH4iS5yVWBwX
	MIlc+DHnja7oPEjp4oRjxV82+gtQa5PdBPcQ7hi6GBmtfedX7B+5U/0i6w9kke1fgg7/
	MIyaIIoiax3K53+gY/GdbOOpg5cQ0upNEiRK6oKWYC9JrbATXlhW6xacZf3bH9EGJvq1
	DO/pfkLqeFZeAJzlbTXiE7X/+vH6sRaaVydQlipt1sGnjnMkwUYL7yuZq1PbQrLqYcei
	ig+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uenJUbt3GrrQe7B3YYNLTOUmwO2JFKqzIHqpBxgtBAQ=;
	b=BCBeLyhBalNbaY/WK6CmKuLjWYdSSy9qezDug7C5kU5QWlLQZWsDa/Ue/NBHNT2d3q
	Jy5EqXYMV+/kvfepla6mkiyv81oGNVIAErG4u5jpfrh1rtt1ReecQefKetXCPVWd7Sm1
	9FLhrllQmNw12KLB8T+VI9eL17/lO09spvp5eMXziQoTn+Q8OxwfV2++J9lgu/yHHJ6u
	SvUrQN2V/ot8yx2H0/0FOMQdCQNnpeHQrAjCkpKRHGoGkfnwA6QJ57bemNOWbOh2mkS1
	gva8ls3PMY1zjZAAWkXEpNJAqpA4mLh/CW/vimSG1T3gH9hsHt8fdgzfkwtmtXlAHrYu
	Tt3g==
X-Gm-Message-State: AOUpUlFnhUF/Kl4sDokujyeiXDLE2HqMZqPXdvxtZKAVxqTlkJ5a9eHF
	ghefuJVyq10HLcOrDEaxBiYgVt5Y/wVZCH6XDaxcDQ==
X-Google-Smtp-Source: AAOMgpflgHekmAuprFKi/5bXEGaHXWhLWb/3QNix7knvlrmAAY49xx+2hKfPSkJKK5dgvBBDlXRrLqzY1Xf0vX8m4i8=
X-Received: by 2002:a2e:2f19:: with SMTP id
	v25-v6mr3703424ljv.113.1533265155096; 
	Thu, 02 Aug 2018 19:59:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 19:59:14 -0700 (PDT)
In-Reply-To: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Aug 2018 23:59:14 -0300
Message-ID: <CADkTA4MaDs7ondvm=qko7NdumuOb5OKo-xQ8MZnOXuYQUtopsA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH v2 0/9] Xen: upgrade to 4.11.0
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
X-List-Received-Date: Fri, 03 Aug 2018 02:59:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 31, 2018 at 4:35 PM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> This patch series:
> * Fixes Xen recipe compatibility with gcc 8.1
> * Adds the Xen recipe for Xen's current version: 4.11.0
> * Upgrades the existing Xen recipe from 4.10.0 to 4.10.1
>     - provided to ease backport to older branches (eg. sumo)

This looks sane to me, and the series is now merged to master.

If it is indeed needed on other branches, or specific patches should
be backported, let me know.

Cheers,

Bruce

> * Adds packaging for the Xen shim component and depriv-fd-checker
> * Removes the 4.10.1 and 4.9.1 recipes
>     - superceded by version 4.11.0
> * Upgrades the vtpm stubdomains to Xen version 4.11.0
> * Applies a bug fix patch to the tpm emulator
> * Fixes whitespace patch fuzz on a vtpm patch
> * Updates the Xen git recipe to build upstream staging
> * Applies a workaround for an upstream parallel build bug
>
> Changes since version 1:
> * Use simpler workaround for the upstream parallel build bug
>   (just build the hypervisor before the tools)
> * Add packaging for the new depriv-fd-checker tool
>
> Christopher Clark (9):
>   xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility
>   xen: add recipe for 4.11.0
>   tpm-emulator: apply patch to fix memcmp defect found by gcc
>   xen-vtpm,mini-os : upgrade to Xen 4.11.0
>   xen-vtpm : fix patch fuzz, whitespace-only change
>   xen: remove 4.9.1 recipe and patches no longer required
>   xen: remove 4.10.1 recipe and patches no longer required
>   xen: package depriv-fd-checker
>   xen: Update git recipe to build latest upstream staging branch
>
>  ...check-to-see-if-removing-a-p2m-entry-actu.patch | 176 ---------------------
>  ...eturn-value-of-p2m_set_entry-when-decreas.patch | 109 -------------
>  .../xen/files/mini-os_udivmoddi4-gcc7.patch        |  43 -----
>  .../xen/files/tools-xentop-vwprintw.patch          |  25 +++
>  .../xen/files/vtpm-deepquote-anyloc.patch          |   8 +-
>  .../xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch  |  28 ++++
>  recipes-extended/xen/files/xsa246-4.9.patch        |  74 ---------
>  recipes-extended/xen/files/xsa248.patch            | 164 -------------------
>  recipes-extended/xen/files/xsa249.patch            |  42 -----
>  recipes-extended/xen/files/xsa250.patch            |  67 --------
>  recipes-extended/xen/files/xsa251.patch            |  21 ---
>  recipes-extended/xen/files/xsa253.patch            |  26 ---
>  recipes-extended/xen/mini-os_4.11.0.bb             |  17 ++
>  recipes-extended/xen/mini-os_4.9.0.bb              |  18 ---
>  recipes-extended/xen/tpm-emulator_0.7.4.bb         |   1 +
>  recipes-extended/xen/xen-vtpm_4.11.0.bb            |  21 +++
>  recipes-extended/xen/xen-vtpm_4.9.0.bb             |  21 ---
>  recipes-extended/xen/xen.inc                       |  15 ++
>  recipes-extended/xen/xen_4.10.0.bb                 |  12 --
>  recipes-extended/xen/xen_4.11.0.bb                 |  12 ++
>  recipes-extended/xen/xen_4.9.1.bb                  |  18 ---
>  recipes-extended/xen/xen_git.bb                    |   7 +-
>  22 files changed, 127 insertions(+), 798 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch
>  delete mode 100644 recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch
>  delete mode 100644 recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
>  create mode 100644 recipes-extended/xen/files/tools-xentop-vwprintw.patch
>  create mode 100644 recipes-extended/xen/files/vtpm_TPM_ChangeAuthAsymFinish.patch
>  delete mode 100644 recipes-extended/xen/files/xsa246-4.9.patch
>  delete mode 100644 recipes-extended/xen/files/xsa248.patch
>  delete mode 100644 recipes-extended/xen/files/xsa249.patch
>  delete mode 100644 recipes-extended/xen/files/xsa250.patch
>  delete mode 100644 recipes-extended/xen/files/xsa251.patch
>  delete mode 100644 recipes-extended/xen/files/xsa253.patch
>  create mode 100644 recipes-extended/xen/mini-os_4.11.0.bb
>  delete mode 100644 recipes-extended/xen/mini-os_4.9.0.bb
>  create mode 100644 recipes-extended/xen/xen-vtpm_4.11.0.bb
>  delete mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb
>  delete mode 100644 recipes-extended/xen/xen_4.10.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.11.0.bb
>  delete mode 100644 recipes-extended/xen/xen_4.9.1.bb
>
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

