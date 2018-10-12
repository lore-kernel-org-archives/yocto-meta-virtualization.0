Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12E30E00B6C; Fri, 12 Oct 2018 07:31:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2331CE00A0C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 07:31:11 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9CEVBf9022413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 07:31:11 -0700 (PDT)
Received: from [128.224.56.49] (128.224.56.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 12 Oct 2018 07:31:10 -0700
To: Sinan Kaya <okaya@kernel.org>, <meta-virtualization@yoctoproject.org>
References: <20181011202832.20004-1-okaya@kernel.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <69417afa-d6aa-5d1d-7408-82e52403ae96@windriver.com>
Date: Fri, 12 Oct 2018 10:31:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181011202832.20004-1-okaya@kernel.org>
Cc: Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [sumo] [PATCH v1 1/2] lxc: fixup 'download' template use
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
X-List-Received-Date: Fri, 12 Oct 2018 14:31:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged to sumo

Bruce

On 10/11/2018 04:28 PM, Sinan Kaya wrote:
> From: Mark Asselstine <mark.asselstine@windriver.com>
> 
> We have a new dependency on 'mountpoint' which is now called in the
> download template script. We also hit an upstream bug due to improper
> use of 'mktemp', so we apply a patch to fix this and sent the fix
> upstream as well.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   ...ually-create-DOWNLOAD_TEMP-directory.patch | 39 +++++++++++++++++++
>   recipes-containers/lxc/lxc_2.0.8.bb           |  2 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
> 
> diff --git a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
> new file mode 100644
> index 0000000..2b1ab87
> --- /dev/null
> +++ b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
> @@ -0,0 +1,39 @@
> +From 1d83b86a9bf017257c068c662ec3bf52ec0cfe90 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 31 May 2018 16:21:45 -0400
> +Subject: [PATCH] templates: actually create DOWNLOAD_TEMP directory
> +
> +The way 'mktemp' is currently used you will get a temp directory in
> +$TMPDIR or '/tmp' and DOWNLOAD_TEMP will not be pointing to an actual
> +directory. This will result in the wget operations failing and the
> +container will fail to create:
> +
> +    ERROR: Failed to download http://....
> +
> +Instead we want to use the '-p' option for mktemp to set the base path
> +and this will ensure that the temp directory is created in the correct
> +location and DOWNLOAD_TEMP will be consistent with this location.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + templates/lxc-download.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/templates/lxc-download.in b/templates/lxc-download.in
> +index f09475d..d6333ad 100644
> +--- a/templates/lxc-download.in
> ++++ b/templates/lxc-download.in
> +@@ -310,7 +310,7 @@ if ! type mktemp >/dev/null 2>&1; then
> +     DOWNLOAD_TEMP=/tmp/lxc-download.$$
> +     mkdir -p $DOWNLOAD_TEMP
> + else
> +-    DOWNLOAD_TEMP=$(mktemp -d)
> ++    DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
> + fi
> +
> + # Simply list images
> +--
> +2.19.0
> +
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
> index c87b875..facad2e 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -23,6 +23,7 @@ RDEPENDS_${PN} = " \
>   		libidn \
>   		gnutls \
>   		nettle \
> +		util-linux-mountpoint \
>   "
>   
>   RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
> @@ -38,6 +39,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>   	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>   	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
>   	file://cgroups-work-around-issue-in-gcc-7.patch \
> +	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
>   	file://dnsmasq.conf \
>   	"
>   
> 


