Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37B87E00D20; Mon,  6 Nov 2017 12:23:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96EE7E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 12:23:15 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id q1so8965715ywh.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 12:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=lPVcoe/2nKsDRYo2psIB7smNHfbts4W8mM7R9c/JfP0=;
	b=UMPFSQnP0MDPevmf/7mjbnw5ZR9hoDB8wGxHrbplnbHkhd8UnVENyjPHU61cY4KW9e
	XxS0U3d823Q4sMHzb2ITTHekkdkQT7koQTTwvPjdjwvx9FSrERmAb8w6YiXf6go+IIMK
	qVe+gmmP1k6S5xlyoG8NNigcxKCKewsUvZnBPv3HwYr7ymp2hMYol+/TAKZD2s615DmS
	76nt6OqgJ2151apTI5QkUSofxRO3iPjiw/qTN3YbcJuUXEPnaBMJ8VzmUaBnIfvtp2aT
	iK/9jquwsHAYAUGen88X47E7sZYaGu58DDVdHoh6Sdio+AYrYDPvCYh3fLnTxZEwrzdQ
	GfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to;
	bh=lPVcoe/2nKsDRYo2psIB7smNHfbts4W8mM7R9c/JfP0=;
	b=mppANpe09NUA7D3YQj6FNtd0D6eePRLCHZUiDMuSnS1sJ6IY78C3mch5BmuiGaJ6fb
	X1dbRUNfUCNB6YvIJ0vx3/RlyLc5ItHgkeJl5uwyRXpS2U1fP5BvboRajQoPInQkMu4l
	JWrA1MPxuAwThN45EnL4rQGspbV5uozq0r5CE8IgllXZCg1Mu1SaUmxwwss9u1qszmIN
	R1WTXCC49idsbGYPsv+ZapCKBZ+zfh1/3FDNf9c/tkhIRcdGXTFqXfHAXOMPkCH1yC2O
	ciVaBIAtYxK/6jnwTuwC3Bx+wKTzEpE7bK/kgBYyK7vXCBGxm/bLZT7ksSqjSLD1RhPW
	UH5Q==
X-Gm-Message-State: AMCzsaUC6OQMSHPIyeI5uJVc1Uh9HGllIjnAALHB4JB/qpXVz9f3XO6Y
	u43hMAzMNUZLMXCFc5mntK1SsuY3e+gFUi4SDeDqJQ==
X-Google-Smtp-Source: ABhQp+Tglr6f0hFfJYCcpb6Xei4lcz0ZXTyLKkN7mUmLuk4/UT/PVVpjK6UiJqlDTrk1ZetF+33wCeK9bbrwh5OC7qc=
X-Received: by 10.13.250.4 with SMTP id k4mr10492690ywf.32.1509999794532; Mon,
	06 Nov 2017 12:23:14 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.131.144 with HTTP; Mon, 6 Nov 2017 12:23:14 -0800 (PST)
In-Reply-To: <1509999503-7154-1-git-send-email-mark.asselstine@windriver.com>
References: <1509999503-7154-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 6 Nov 2017 15:23:14 -0500
X-Google-Sender-Auth: j_YJkzWbKM3OUdwdqacRiaBJbD8
Message-ID: <CAPuovELQuXrjvz37VPA8TTYPDGLhJgFz81YzVCw2NgPpF7YrGg@mail.gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [v2 PATCH] python-webob: uprev to v1.7.3
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
X-List-Received-Date: Mon, 06 Nov 2017 20:23:16 -0000
Content-Type: text/plain; charset="UTF-8"

With the file being small git isn't matching the rename even when I
toggle the threashold value. Not much I can do folks.

Mark

On Mon, Nov 6, 2017 at 3:18 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> The only user in meta-virtualization is python-bugsnag and there is no
> version dependency. This new version is however required by the latest
> openstack. Switched to using the "common" pypi.bbclass while we are at
> it.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/python/python-webob_1.6.0.bb | 23 -----------------------
>  recipes-devtools/python/python-webob_1.7.3.bb | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 23 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-webob_1.6.0.bb
>  create mode 100644 recipes-devtools/python/python-webob_1.7.3.bb
>
> diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.6.0.bb
> deleted file mode 100644
> index 71c74ff..0000000
> --- a/recipes-devtools/python/python-webob_1.6.0.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION = "WSGI request and response object"
> -HOMEPAGE = "http://webob.org/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5"
> -
> -PR = "r0"
> -SRCNAME = "WebOb"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
> -SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} += " \
> -       python-sphinx \
> -       python-nose \
> -       "
> -
> diff --git a/recipes-devtools/python/python-webob_1.7.3.bb b/recipes-devtools/python/python-webob_1.7.3.bb
> new file mode 100644
> index 0000000..a2448be
> --- /dev/null
> +++ b/recipes-devtools/python/python-webob_1.7.3.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "WSGI request and response object"
> +HOMEPAGE = "http://webob.org/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5"
> +
> +PYPI_PACKAGE = "WebOb"
> +
> +SRC_URI[md5sum] = "350028baffc508e3d23c078118e35316"
> +SRC_URI[sha256sum] = "e65ca14b9f5ae5b031988ffc93f8b7f305ddfcf17a4c774ae0db47bcb3b87283"
> +
> +inherit setuptools pypi
> +
> +RDEPENDS_${PN} += " \
> +       python-sphinx \
> +       python-nose \
> +       "
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

