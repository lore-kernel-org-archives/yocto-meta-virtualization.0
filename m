Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73A53E00DD1; Tue,  9 Jan 2018 09:27:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A612FE00D6B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jan 2018 09:27:15 -0800 (PST)
Received: by mail-wm0-f65.google.com with SMTP id f206so22092809wmf.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jan 2018 09:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UKOT1Ff8uUTrFvakGzo9RnuFGaX334+eH+eiri8aNHE=;
	b=YdlfUC2m0Gcs3hHcpttD0wSOctw/4RJonn/f1akxWbVTd1AbHw+7+Ws8HN3yIpLLht
	F/ns+oeFvVKNGzbiGfJ9yzsOgkfLLpiO4WgJyAJ90Hc0V9N3cK6+qn98fdyWsm1lvWKD
	qaFjHiTpp9rmT5k9vEBMbCHBAnQKK+S/0twD+fWkc/UHfqR3n+gQmTQwQJy38N3ovHHN
	RRN1Jw0z/9dU0cWi6t7mY7WobuOghKJFFJJyiYfDklIPsua0VUERNn5vloLOAXS+RLRT
	5ClM56w0jT1Aiaf176AvlbCk70HhAjLkwWkuFw4Q2PPW1Yiqesn9lGWB9T3On5TvAtKd
	Ioug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UKOT1Ff8uUTrFvakGzo9RnuFGaX334+eH+eiri8aNHE=;
	b=dYTFKvAP0HPSQFCQDUZ0DcWCz0C2qoEPOkALn93BFzYc3Gfs1kzI/MRQrnx+i6UjaO
	75CG3XdZq+eQocpFu/2e2um8bETgUzHc17tkZG/HxYm4ciqtvESVsyoylXFOB9tYUxhr
	Rm3IpJLq3iPRWjNyZawcHVoIEGBbHytlqNyoP909fS87VpEnoNVOrSElZ5iDcrdeqr5G
	9hAt/bFeba95Ueq5ZLx19GK1BzAo8h3X0AV2lfNM1Joti8zXIZFPgvx+5Wz9/M0fA2Gk
	NsHzSLAgOPRUKxgVi5Un0iVgiiZDocPFvfAn2C9+8gv8GsJPbpD5Ay7QIkzWzKtouxlK
	wGwg==
X-Gm-Message-State: AKGB3mLFCfVkd6J/qUpawmBOndJaDLfK5imzxOlYO7mUmDt6lsNaap7f
	qXDFJjd+xw/HCRDuBfxEAG12Uo5fTU7HLfA8bpc=
X-Google-Smtp-Source: ACJfBovct3JCLjUdDrffHajzaHAFZ1w9Ebpczfa1EM85Ik7FnSuM6i4wKhuif0fgVsKRx1DT1uQNsnMpxbCTsfq2ixY=
X-Received: by 10.28.69.8 with SMTP id s8mr11200030wma.25.1515518834333; Tue,
	09 Jan 2018 09:27:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 9 Jan 2018 09:26:43 -0800 (PST)
In-Reply-To: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
References: <1515481968-4085-1-git-send-email-christopher.w.clark@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Jan 2018 09:26:43 -0800
Message-ID: <CAKmqyKOQ9LrDLPOcwmy5nMytLW0MMNQyFXWi0NkBeURWp=Eqyg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, cardoe@gentoo.org
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
X-List-Received-Date: Tue, 09 Jan 2018 17:27:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 8, 2018 at 11:12 PM,  <christopher.w.clark@gmail.com> wrote:
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

Cool!

For the whole series:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

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
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

