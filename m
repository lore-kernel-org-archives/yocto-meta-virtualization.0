Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4691AE00DC3; Thu, 22 Sep 2016 07:05:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DDA8E00CA1;
	Thu, 22 Sep 2016 07:05:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8ME5ogZ021557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 22 Sep 2016 07:05:50 -0700
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Sep 2016 07:05:49 -0700
To: <kai.kang@windriver.com>
References: <20160922074250.1202-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8af56c88-a94d-3e21-041d-9a7b656db0de@windriver.com>
Date: Thu, 22 Sep 2016 10:05:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160922074250.1202-1-kai.kang@windriver.com>
Cc: yocto@yoctoproject.org, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: remove .o files for ptest
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
X-List-Received-Date: Thu, 22 Sep 2016 14:05:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-22 03:42 AM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> When do split_and_strip_files, it may calls debugedit to deal elf files.
> For ptest sub-package, it fails to run debugedit with .o files. So remove
> the .o files which are redundant to run ptest cases.

Wrong mailing list (still) .. but merged regardless.

Bruce

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index 3eff58d..fad5632 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -275,7 +275,7 @@ do_install_ptest() {
>  	find ${S}/tests -maxdepth 1 -type d -exec cp -r {} ${D}${PTEST_PATH}/tests/ \;
>
>  	# remove .la files for ptest, they aren't required and can trigger QA errors
> -	for i in `find ${D}${PTEST_PATH} -type f -name *.la`; do
> +	for i in `find ${D}${PTEST_PATH} -type f \( -name *.la -o -name *.o \)`; do
>                  rm -f $i
>  	done
>  }
>


