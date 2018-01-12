Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB331E00E8C; Fri, 12 Jan 2018 07:39:07 -0800 (PST)
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
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2711AE00E84
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jan 2018 07:39:06 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id u76so9069196qku.11
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jan 2018 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CxLL7kicsVyLcmOyJPl/P3E9kIwyqVxHbdnvjHcKUaU=;
	b=D/Tdk1jlM7kOVzCSYPJoYTj4AD1JhrWCdqk+wVgXiT9fR0wx6dnceEYIs//JTyPw/Q
	hEddMIRP6SLC/C//TClw7EbJffYgIn+MXMtrwFrdl9P/x9jgpV7DZ8/eejk97PcSdEft
	uh+TNIlRUZRKlEeDXcfC+rBK1VwOFAQ3D1P3mDZxfurMQFInd3znzZhBPr/kc5c20gyr
	wAMCWwFRgDli5LleoD1eBDMn44HSbtVSAqf1HaJTMdqNxNs1Mn6lsropaLXYylvRxdXB
	nsonbW2riWS6zDDBchogAoNSO1o4UPsKkbwEx4wxOBJ7HJ+yD+eOZJld17GSABk8veN6
	bhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CxLL7kicsVyLcmOyJPl/P3E9kIwyqVxHbdnvjHcKUaU=;
	b=P2BSP3MKYRB/eyEM1ekrNjG8PKsY3ye2/a+ZnMelJJvp9PMLJkrRTHVdHngeSqwqS6
	fwO0AzsY2ZFg5j9jDGyEMcR97+RZWyI8dwuAUskh3alB4rwYRKigjowpvncN/4JimW5+
	hAyqVSdtG38fEaj6onO0ZjtczC+QjSjaHm+JZUNA++fOkpSI21+gb+j4F+9WGKnvym1i
	3fsqxcXsnVXAHJcv+O/PD/B1puyM7L5a3VnSfh0KHWwwnr7o6RBnTGez1a89VGRwKsNk
	1ZwCH/aWpktbGyOvePiUL6bb5gwk85lcIUm9zU4C8aV5AxsmGeccoeRzllEFSyQr4hm0
	1s0Q==
X-Gm-Message-State: AKwxytcLA/dSAM2t6rvZHI04Q3KNBv7cZvGmOnTi4sSYiL81pPYnBWFm
	f3U+GVROW3ZDyIJTV0rgejiDSFe31gdIGvtlVME=
X-Google-Smtp-Source: ACJfBotBqxiilKvHF8DgdYHjDfN0Bq/LhwIbUHN5RnfuttZsZX5TnRHFCTKkWP9ZyFBqhWyoyF61zvJIKdTL6mxus00=
X-Received: by 10.55.214.22 with SMTP id t22mr35072963qki.19.1515771546252;
	Fri, 12 Jan 2018 07:39:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Fri, 12 Jan 2018 07:39:05 -0800 (PST)
In-Reply-To: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
References: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Jan 2018 10:39:05 -0500
Message-ID: <CADkTA4M5qvcihcJqDEnERmpcHu2q8Ptw7zyw4G8wHPXkPmVV5w@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 0/5] Upgrade Xen to 4.10.0, 4.9.1 and apply XSA patches
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
X-List-Received-Date: Fri, 12 Jan 2018 15:39:07 -0000
Content-Type: text/plain; charset="UTF-8"

I see no objections on the list, so this is now merged.

Thanks for the updates!

Bruce

On Tue, Jan 9, 2018 at 2:12 AM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> A short patch series to:
>
> * Introduce support for Xen 4.10.0
>     - package a new library, libxentoolcore, and a new tool, xen-diag
>     - make the deprecated blktap packages optional for xen-base
>       -- it no longer RDEPENDS upon them, but RRECOMMENDS instead
>       to retain xen.inc compatability with earlier Xen releases
>     - and apply a patch for XSA-253 / CVE-2018-5244
>
> * Upgrade the Xen 4.9 series recipe to latest 4.9.1
>     - and apply XSA/CVE patches
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>
> (Please use my gmail address for correspondence.)
>
> Christopher Clark (5):
>   xen: upgrade 4.9.x recipe to 4.9.1 and apply XSA/CVE fix patches
>   xen: Package libxentoolcore and xen-diag, introduced in Xen 4.10
>   xen: xen.inc: remove xen-blktap from xen-base RDEPENDS
>   xen: add recipe for Xen 4.10.0
>   xen: Apply patch for CVE-2018-5244 / XSA-253
>
>  ...check-to-see-if-removing-a-p2m-entry-actu.patch | 176 +++++++++++++++++++++
>  ...eturn-value-of-p2m_set_entry-when-decreas.patch | 109 +++++++++++++
>  ...x-libxc-xc_dom_arm-missing-initialization.patch |  36 -----
>  recipes-extended/xen/files/xsa246-4.9.patch        |  74 +++++++++
>  recipes-extended/xen/files/xsa248.patch            | 164 +++++++++++++++++++
>  recipes-extended/xen/files/xsa249.patch            |  42 +++++
>  recipes-extended/xen/files/xsa250.patch            |  67 ++++++++
>  recipes-extended/xen/files/xsa251.patch            |  21 +++
>  recipes-extended/xen/files/xsa253.patch            |  26 +++
>  recipes-extended/xen/xen.inc                       |  15 +-
>  recipes-extended/xen/xen_4.10.0.bb                 |  12 ++
>  recipes-extended/xen/xen_4.9.0.bb                  |  12 --
>  recipes-extended/xen/xen_4.9.1.bb                  |  18 +++
>  13 files changed, 721 insertions(+), 51 deletions(-)
>  create mode 100644 recipes-extended/xen/files/0001-p2m-Always-check-to-see-if-removing-a-p2m-entry-actu.patch
>  create mode 100644 recipes-extended/xen/files/0002-p2m-Check-return-value-of-p2m_set_entry-when-decreas.patch
>  delete mode 100644 recipes-extended/xen/files/fix-libxc-xc_dom_arm-missing-initialization.patch
>  create mode 100644 recipes-extended/xen/files/xsa246-4.9.patch
>  create mode 100644 recipes-extended/xen/files/xsa248.patch
>  create mode 100644 recipes-extended/xen/files/xsa249.patch
>  create mode 100644 recipes-extended/xen/files/xsa250.patch
>  create mode 100644 recipes-extended/xen/files/xsa251.patch
>  create mode 100644 recipes-extended/xen/files/xsa253.patch
>  create mode 100644 recipes-extended/xen/xen_4.10.0.bb
>  delete mode 100644 recipes-extended/xen/xen_4.9.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.9.1.bb
>
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

