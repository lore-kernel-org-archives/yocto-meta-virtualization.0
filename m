Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7AAAE00CB9; Sun,  1 Sep 2019 18:32:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6ADA3E00CB9
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 18:32:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x821Vxnl006057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 1 Sep 2019 18:31:59 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 1 Sep 2019 18:31:58 -0700
To: <meta-virtualization@yoctoproject.org>
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-6-stefan@agner.ch>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <bfacfb8a-fba3-325c-4a20-3d918d40bfb8@windriver.com>
Date: Mon, 2 Sep 2019 09:45:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190901203338.38768-6-stefan@agner.ch>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH 5/6] cni: move cni tools to /usr/lib/cni
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
X-List-Received-Date: Mon, 02 Sep 2019 01:32:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2019 04:33 AM, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Use a standard location to store the cni tools and plugins. This
> is more in line how other distributions package cni.

But from what I see, at least Fedora and Ubuntu are using /opt/cni/bin 
directory.
Also, have you tested such change with simple k8s setup which makes use 
of these plugins? E.g. flannel?

Best Regards,
Chen Qi

> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>   recipes-containers/cri-o/files/crio.conf | 2 +-
>   recipes-networking/cni/cni_git.bb        | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
> index 51d7f40..dd22465 100644
> --- a/recipes-containers/cri-o/files/crio.conf
> +++ b/recipes-containers/cri-o/files/crio.conf
> @@ -144,4 +144,4 @@ registries = [
>   network_dir = "/etc/cni/net.d/"
>   
>   # plugin_dir is is where CNI plugin binaries are stored.
> -plugin_dir = "/opt/cni/bin/"
> +plugin_dir = "/usr/lib/cni/"
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
> index 5348b95..86e5e0f 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -63,7 +63,7 @@ do_compile() {
>   }
>   
>   do_install() {
> -    localbindir="/opt/cni/bin"
> +    localbindir="${libdir}/cni/"
>   
>       install -d ${D}${localbindir}
>       install -d ${D}/${sysconfdir}/cni/net.d
> @@ -72,7 +72,7 @@ do_install() {
>       install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>   }
>   
> -FILES_${PN} += "/opt/cni/bin/*"
> +FILES_${PN} += "${libdir}/cni/*"
>   
>   INSANE_SKIP_${PN} += "ldflags already-stripped"
>   



