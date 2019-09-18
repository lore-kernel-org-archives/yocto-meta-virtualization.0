Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26643E00D8F; Wed, 18 Sep 2019 10:54:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  2.6 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECBC4E00C87
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:54:26 -0700 (PDT)
Received: by mail-io1-f65.google.com with SMTP id b136so1314691iof.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/3I7aaVX4X5Px9MDTYR+xg4mTH1HpQeVsIkHoMfwlY8=;
	b=CEqdcOdJ2WK21LHYOnUFriOTPuRt1RkH5AD7Om/QecWjiF8SAHerNUXdFM/FhxM9BC
	nIUFH7tgF1NoUIgbCsS6XCZum75vSDuGTi51MdRFnBNmIFziFQiNoD7HyxB8n1etDtR1
	aaN+ufQeMp+7eF22ISitBRCJFv523bFGVOpYBLLlwFjHIhAJzMx1qgnX04bicxw7kE17
	5uTDde5Vsk3Pm7aPJK7VPVnB3lCQ1wpStQdOqEZ9dVoc4FDOaJ7nnHx5CSXJJVqcZpBk
	Ek7yZM9sgxovO1JBhnn5vxTxmYL7Znhu6i4KhhF+5jkNAzkhjsxJwjiDNNGWYT5raGMD
	FnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/3I7aaVX4X5Px9MDTYR+xg4mTH1HpQeVsIkHoMfwlY8=;
	b=nFvUxppQ+v1yXR0NxvZH9kfEI0VxxmJP158C8bb0XcXY7OJHIDG1IF6lA1UGfn+Y9C
	Nlk1wLsN2K8bWdkuhTJisq5hNGArqyWAhAxQB+P8Fh+DP0sOlGuT2r0LLKVaQfa7vxAF
	x58OntFxy5vR2ItIGa2FTb9GKG8pTGwmjmFf/ulwuIslQBB/ieSHcBKNiMoPc6Ggr5ot
	Z4kC8jOO3YCb8veSQECN+4Cuo41S7w5tINz5pYQc3yxqRqTIB21W713J7FoeRfFNg5Xj
	izx4TKB2RTgRdGzrbGxqp6G6GFY2mjT42Z6AospQRfEb/LrtrxiY76s6LA0sZQMlaH+u
	tsPg==
X-Gm-Message-State: APjAAAVtBmW9qF9As+NcQddCl3gLIw7ToEsdX+FsaFYkLQBfdknlEK1b
	4tOHZppzJKW3h6XRmso0j2GXIkKOn6CclA==
X-Google-Smtp-Source: APXvYqxb24wA+swIW+ABrKbEmos9T5c6httjYR6w7+rMlDnLsqvALJsBsFji6DCn6XfvO9zTQfal7Q==
X-Received: by 2002:a6b:c382:: with SMTP id t124mr6679842iof.105.1568829266182;
	Wed, 18 Sep 2019 10:54:26 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s19sm3143716iob.81.2019.09.18.10.54.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 10:54:25 -0700 (PDT)
Date: Wed, 18 Sep 2019 13:54:23 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joakim Roubert <joakim.roubert@axis.com>
Message-ID: <20190918175422.GB22136@gmail.com>
References: <20190917134727.3174-1-joakimr@axis.com>
MIME-Version: 1.0
In-Reply-To: <20190917134727.3174-1-joakimr@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org, Joakim Roubert <joakimr@axis.com>
Subject: Re: [PATCH] templates/lxc-download.in: Use curl instead of wget
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
X-List-Received-Date: Wed, 18 Sep 2019 17:54:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged

Bruce

In message: [meta-virtualization] [PATCH] templates/lxc-download.in: Use curl instead of wget
on 17/09/2019 Joakim Roubert wrote:

> When curl's MIT license is preferable to wget's GPLv3. Which it is in
> several situations.
> 
> Change-Id: I72ee1ce66493c564557b73fae80f5219ef83af6d
> Signed-off-by: Joakim Roubert <joakimr@axis.com>
> ---
>  .../templates-use-curl-instead-of-wget.patch  | 49 +++++++++++++++++++
>  recipes-containers/lxc/lxc_3.2.1.bb           |  3 +-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> 
> diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> new file mode 100644
> index 0000000..4b185bf
> --- /dev/null
> +++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> @@ -0,0 +1,49 @@
> +From dd7b0a2e4542c352456747a45d7eeb11e9fdec26 Mon Sep 17 00:00:00 2001
> +From: Joakim Roubert <joakimr@axis.com>
> +Date: Fri, 16 Aug 2019 07:52:48 +0200
> +Subject: [PATCH] Use curl instead of wget
> +
> +When curl's MIT license is preferable to wget's GPLv3.
> +
> +Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8
> +Signed-off-by: Joakim Roubert <joakimr@axis.com>
> +---
> + templates/lxc-download.in | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/templates/lxc-download.in b/templates/lxc-download.in
> +index b70daaf..9526eae 100644
> +--- a/templates/lxc-download.in
> ++++ b/templates/lxc-download.in
> +@@ -74,9 +74,9 @@ cleanup() {
> +   fi
> + }
> + 
> +-wget_wrapper() {
> ++curl_wrapper() {
> +   for _ in $(seq 3); do
> +-    if wget "$@"; then
> ++    if curl "$@"; then
> +       return 0
> +     fi
> +   done
> +@@ -85,8 +85,8 @@ wget_wrapper() {
> + }
> + 
> + download_file() {
> +-  if ! wget_wrapper -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
> +-    if ! wget_wrapper -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
> ++  if ! curl_wrapper -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
> ++    if ! curl_wrapper -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
> +       if [ "$3" = "noexit" ]; then
> +         return 1
> +       else
> +@@ -266,7 +266,7 @@ while :; do
> + done
> + 
> + # Check for required binaries
> +-for bin in tar xz wget; do
> ++for bin in tar xz curl; do
> +   if ! command -V "${bin}" >/dev/null 2>&1; then
> +     echo "ERROR: Missing required tool: ${bin}" 1>&2
> +     exit 1
> diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
> index 4b8f10b..b852515 100644
> --- a/recipes-containers/lxc/lxc_3.2.1.bb
> +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  DEPENDS = "libxml2 libcap"
>  RDEPENDS_${PN} = " \
>  		rsync \
> +		curl \
>  		gzip \
>  		xz \
>  		tar \
> -		wget \
>  		libcap-bin \
>  		bridge-utils \
>  		dnsmasq \
> @@ -41,6 +41,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>  	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
>  	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
>  	file://template-make-busybox-template-compatible-with-core-.patch \
> +	file://templates-use-curl-instead-of-wget.patch \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://tests-add-no-validate-when-using-download-template.patch \
>  	file://network-restore-ability-to-move-nl80211-devices.patch \
> -- 
> 2.20.1
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

