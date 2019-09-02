Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E789E00D60; Mon,  2 Sep 2019 02:10:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01A94E008D3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Sep 2019 02:10:51 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x829AEUr012232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Sep 2019 02:10:24 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 2 Sep 2019 02:10:03 -0700
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
References: <1567413409-22401-1-git-send-email-hongxu.jia@windriver.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <14a70722-9e6e-a3fe-3758-ef57069fea9d@windriver.com>
Date: Mon, 2 Sep 2019 17:10:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567413409-22401-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/2] kubernetes: building unstripped binaries
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
X-List-Received-Date: Mon, 02 Sep 2019 09:10:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/2/19 4:36 PM, Hongxu Jia wrote:
> Specify GOLDFLAGS as an empty string for building unstripped binaries, which allows
> you to use code debugging tools like delve. When GOLDFLAGS is unspecified, it defaults
> to "-s -w" which strips debug information. Other flags that can be used for GOLDFLAGS
> are documented at https://golang.org/cmd/link/ [1]

Clarify one thing, make the binary *unstripped* at do_compile time,

thus Yocto will split it to stripped + dbg

//Hongxu


> [1] https://github.com/kubernetes/kubernetes/blob/master/build/root/Makefile#L82
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index b7862ec..821f51f 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -54,7 +54,7 @@ do_compile() {
>   	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>   	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>   	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
> -	make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH}
> +	make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH} GOLDFLAGS=""
>   }
>   
>   do_install() {



