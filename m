Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A595BE006EA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Oct 2013 10:17:34 -0700 (PDT)
Received: from host60.citrix.com ([66.165.176.60] helo=[172.16.1.10])
	by www.twobit.us with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VTER2-0005HN-VL; Mon, 07 Oct 2013 17:17:33 +0000
Message-ID: <5252EC72.1020808@twobit.us>
Date: Mon, 07 Oct 2013 13:16:34 -0400
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: meta-virtualization@yoctoproject.org
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
	<1381094537-11576-2-git-send-email-cjp256@gmail.com>
In-Reply-To: <1381094537-11576-2-git-send-email-cjp256@gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 66.165.176.60
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Subject: Re: [PATCH] xen: add INSANE_SKIP flag 'already-stripped' to silence QA warnings about stripped qemu binaries.
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
X-List-Received-Date: Mon, 07 Oct 2013 17:17:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

+1 on this

On 10/06/2013 05:22 PM, Chris Patterson wrote:
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen_4.3.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
> index 9cbd2ac..e9a22cc 100644
> --- a/recipes-extended/xen/xen_4.3.0.bb
> +++ b/recipes-extended/xen/xen_4.3.0.bb
> @@ -299,6 +299,7 @@ FILES_${PN}-python = "\
>      ${libdir}/python2.7 \
>      "
>  
> +INSANE_SKIP_${PN} = "already-stripped"
>  INSANE_SKIP_${PN}-qemu = "arch"
>  FILES_${PN}-qemu = " \
>      ${datadir}/xen/qemu \
> 


