Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3256E00474; Mon, 16 May 2016 08:12:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76CD4E00343
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 May 2016 08:12:55 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4GFCsxG006115
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 May 2016 08:12:55 -0700 (PDT)
Received: from server.local (147.11.118.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 May 2016 08:12:54 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1463166466-26378-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <d3852f93-912c-ec5c-6808-be081d5defdd@windriver.com>
Date: Mon, 16 May 2016 11:12:53 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <1463166466-26378-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] go-cross: don't use host /var/tmp for temporary build artifacts
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
X-List-Received-Date: Mon, 16 May 2016 15:12:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-13 3:07 PM, Mark Asselstine wrote:
> The default behavior for go-cross build is to use the path specified
> in TMPDIR for some temporary build artifacts and if no TMPDIR is set
> in the environment to fallback to use /var/tmp. This causes a build
> failure on hosts that do not have a /var/tmp or that have restrictive
> permissions on /var/tmp. The failure is seen as:
>
>   go tool dist: mkdtemp(/var/tmp/go-cbuild-yhmNbi): No such file or directory
>
> By setting TMPDIR and ensuring we create this
> directory we can avoid the associated issue with using the default.

merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/go-cross/go-cross.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-cross/go-cross.inc
> index eea1b2c..cd75b40 100644
> --- a/recipes-devtools/go-cross/go-cross.inc
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -17,9 +17,13 @@ CC = "${@d.getVar('BUILD_CC', True).strip()}"
>  do_configure[noexec] = "1"
>
>  do_compile() {
> -    export GOBIN="${B}/bin"
> +    export GOBIN="${B}/bin"
>      rm -rf ${GOBIN} ${B}/pkg
>      mkdir ${GOBIN}
> +
> +    export TMPDIR=${WORKDIR}/build-tmp
> +    mkdir ${WORKDIR}/build-tmp
> +
>      cd src
>      ./make.bash --host-only
>  }
>


