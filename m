Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF09AE00AD1; Tue,  9 Oct 2018 03:33:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B35DE00A4F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Oct 2018 03:33:13 -0700 (PDT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w99AX6Ll000523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 9 Oct 2018 11:33:08 +0100
Message-ID: <cf8478a59597553cf3bf69e1c3174ad69fac47e7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dengke Du <dengke.du@windriver.com>, meta-virtualization@yoctoproject.org
Date: Tue, 09 Oct 2018 11:33:06 +0100
In-Reply-To: <1539079412-37928-1-git-send-email-dengke.du@windriver.com>
References: <1539079412-37928-1-git-send-email-dengke.du@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2] ceph: only support x86-64
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
X-List-Received-Date: Tue, 09 Oct 2018 10:33:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-09 at 18:03 +0800, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-extended/ceph/ceph_13.2.1.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-extended/ceph/ceph_13.2.1.bb b/recipes-
> extended/ceph/ceph_13.2.1.bb
> index d7186b9..7888e64 100644
> --- a/recipes-extended/ceph/ceph_13.2.1.bb
> +++ b/recipes-extended/ceph/ceph_13.2.1.bb
> @@ -60,3 +60,4 @@ FILES_${PN}-dev += "\
>  RDEPENDS_${PN} += "\
>  		python \
>  "
> +COMPATIBLE_MACHINE = "(qemux86-64|intel-x86-64)"

If you mean x86-64, don't you want COMPATIBLE_HOST ?

Cheers,

Richard


