Return-Path: <Maxin.John@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A71D5E006ED; Tue, 15 Jul 2014 09:28:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 51F86E00543
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Jul 2014 09:28:07 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 15 Jul 2014 18:28:01 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id BDC72288F32;
	Tue, 15 Jul 2014 18:28:01 +0200 (CEST)
Date: Tue, 15 Jul 2014 18:28:01 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <20140715162801.GA28780@sestofb10.enea.se>
References: <1404908262-4773-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1404908262-4773-1-git-send-email-maxin.john@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: Re: [PATCH] kvm-image-minimal: Fix warning
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
X-List-Received-Date: Tue, 15 Jul 2014 16:28:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Wed, Jul 09, 2014 at 02:17:42PM +0200, Maxin B. John wrote:
> Fix this warning:
> WARNING: Function remove_packaging_data_files doesn't exist
> 
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  recipes-extended/images/kvm-image-minimal.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
> index abc0fee..c96edca 100644
> --- a/recipes-extended/images/kvm-image-minimal.bb
> +++ b/recipes-extended/images/kvm-image-minimal.bb
> @@ -21,5 +21,3 @@ LICENSE = "MIT"
>  inherit core-image
>  
>  IMAGE_ROOTFS_SIZE = "8192"
> -
> -ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> -- 

Gentle ping.


Best Regards,
Maxin

