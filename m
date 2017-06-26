Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32E40E0084A; Mon, 26 Jun 2017 10:57:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (asselsm[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EDE7E0048B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Jun 2017 10:57:14 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id g124so471875ywg.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Jun 2017 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IVHki1tmtKeVzcPPmO68/sEI9sRVJ8I8+Awr4061VDQ=;
	b=hAgdzN9sju2dWSMGPlJ8DSc6spKr1Zky4pyAIznlL/M+sS+NdAJvcPfBMfEisIbmPq
	jfMEL7QdkHM/33247BMD/jBUfCMadVHdjDlgRO8va92EOaaY3nGTaWOrDpBrqX94iWQN
	A3hbRT95Yq/oay1XCbg2SFN1F7SRVtr3Avtbfc+SrxTRnk0M9bimDLQ9JUWaVD2n9g0U
	nATWSVqAAJTXc5CXr7TEGMY/cC5kUM0VvVTkQEpoIch8EzU+v0OETniKdKQ8K89etNGh
	go1zYaJoIvMizOrcBjxpHldaf+fsW8+AGkvCn7F3UdLnDbtWqRB0nE/v2C6Ksd0eObBj
	WJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IVHki1tmtKeVzcPPmO68/sEI9sRVJ8I8+Awr4061VDQ=;
	b=RRNf1o3daCHwEzCuJhguPjZk5G8y4qI6NhovYWKFO+GwvUm6uZTfSu6FbKmz/NV7wG
	B0Oj4pXnVuWT4aWeNaYLcwL+Sqp/WZfUCNPvX7zE6iL2QN34P4bQoALnmZnz5T1LvVZS
	WpfnAWhvEvCXqXJH2Mte9o80qcaQaQQ+D6t+5Krr+FAiq3wrgrph8fmpoxZnoAgmfvci
	sHpxcZn8EmXU9c7ne6pNQgB8hkyZdtzwDIoJdQe1cBckqJAOE+DRXCqX6O1osQtFH2kU
	Gq1DuygJj0uZ9PWtfi1CdesIT6eJ0M9NTFZO8sUElgSTuKD/ngbPWrSDdxh7i1klY66m
	B5mA==
X-Gm-Message-State: AKS2vOxft6HQq/6M9ab6EtvIgd9+pi27ndB07J7DbmN87n0PfeFINyv/
	EQsP4tsqNmhSOEBREHVm0SDJHN46IQ==
X-Received: by 10.129.31.86 with SMTP id f83mr1022307ywf.210.1498499833433;
	Mon, 26 Jun 2017 10:57:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.17.129 with HTTP; Mon, 26 Jun 2017 10:57:12 -0700 (PDT)
In-Reply-To: <1498468106-8846-1-git-send-email-zhe.he@windriver.com>
References: <1498468106-8846-1-git-send-email-zhe.he@windriver.com>
From: Mark Asselstine <asselsm@gmail.com>
Date: Mon, 26 Jun 2017 13:57:12 -0400
Message-ID: <CAPuovEK4Hyt3JYAQKCMKtNrqNrT2=UbP7hZN0RG+YVLw_2Hcrg@mail.gmail.com>
To: zhe.he@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] protobuf protobuf-c: Remove COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 26 Jun 2017 17:57:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 26, 2017 at 5:08 AM,  <zhe.he@windriver.com> wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> protobuf and protobuf-c can actually work with all arches but they were
> limited and merged upstream by 5e5e09a18199108de29bfee101c7b311ef094d94
>
> This patch removes the COMPATIBLE_HOST to re-enable them to work with
> other architectures.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---

Bruce, I had a look at this and the changes look fine and match what
is in meta-oe. Let me know if you are still in favour of removing
these to use the copies in meta-oe, something you have mentioned in
the past but we have yet to follow through with.

Mark

>  recipes-devtools/protobuf/protobuf-c_1.2.1.bb | 2 --
>  recipes-devtools/protobuf/protobuf_3.1.0.bb   | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> index ff2499e..daba0ed 100644
> --- a/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> +++ b/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> @@ -6,8 +6,6 @@ LICENSE = "Apache-2.0"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
>
> -COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> -
>  DEPENDS = "protobuf protobuf-c-native"
>
>  SRC_URI[md5sum] = "e544249c329391fff512c3874895cfbe"
> diff --git a/recipes-devtools/protobuf/protobuf_3.1.0.bb b/recipes-devtools/protobuf/protobuf_3.1.0.bb
> index 78b0d60..7d6698d 100644
> --- a/recipes-devtools/protobuf/protobuf_3.1.0.bb
> +++ b/recipes-devtools/protobuf/protobuf_3.1.0.bb
> @@ -19,8 +19,6 @@ SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.gz;downloadfile
>                 file://run-ptest \
>              "
>
> -COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> -
>  EXTRA_OECONF += " --with-protoc=${STAGING_BINDIR_NATIVE}/protoc"
>  inherit autotools setuptools ptest
>
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

