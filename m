Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1B05E008C6; Sun, 30 Apr 2017 20:20:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DC72E007BA
	for <meta-virtualization@yoctoproject.org>;
	Sun, 30 Apr 2017 20:20:38 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v413KZ0V021401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 30 Apr 2017 20:20:35 -0700
Received: from server.local (128.224.21.87) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 30 Apr 2017 20:20:34 -0700
To: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>,
	<meta-virtualization@yoctoproject.org>
References: <1493394199-23296-1-git-send-email-iurii.mykhalskyi@globallogic.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5526ce18-56ba-bc9b-b705-1a58974ad958@windriver.com>
Date: Sun, 30 Apr 2017 23:20:33 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493394199-23296-1-git-send-email-iurii.mykhalskyi@globallogic.com>
Cc: mark.asselstine@windriver.com
Subject: Re: [PATCH] xen: Fix mistype error in xen-watchdog systemd service
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
X-List-Received-Date: Mon, 01 May 2017 03:20:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-04-28 11:43 AM, Iurii Mykhalskyi wrote:
> Due to error in naming this service will not be autoenabled in
> systems with systemd init manager
>

merged.

Bruce

> Signed-off-by: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 0084274..a28d474 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
>
>  # systemd packages
>  SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
> -SYSTEMD_SERVICE_${PN}-watchdog = "xen-watchdog.service"
> +SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
>  SYSTEMD_SERVICE_${PN}-xencommons = " \
>      proc-xen.mount \
>      var-lib-xenstored.mount \
>


