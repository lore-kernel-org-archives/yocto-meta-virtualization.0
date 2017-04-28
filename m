Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2086E00985; Fri, 28 Apr 2017 06:43:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C18A1E00953
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Apr 2017 06:43:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3SDhhDb009417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Apr 2017 06:43:44 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 06:43:43 -0700
To: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>,
	<meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>
References: <1490280257-11855-1-git-send-email-iurii.mykhalskyi@globallogic.com>
	<CAC+yBMvfnV8iH713WgDyNO6mdJ969GX8EwT4wLCFzds+U0FX=g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <805a504a-92ee-2764-deac-24126350a06b@windriver.com>
Date: Fri, 28 Apr 2017 09:43:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAC+yBMvfnV8iH713WgDyNO6mdJ969GX8EwT4wLCFzds+U0FX=g@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 13:43:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/28/2017 07:11 AM, Iurii Mykhalskyi wrote:
> Hello guys,
>
> any updates regarding this patch?
>

I have no record of the patch, or this follow up ever making it to
my meta-virt gmail filter .. so it looks like it was grabbed by
spam or has otherwise, gone missing.

This email is in my spam folder on gmail with:

------
It has a from address in globallogic.com but has failed 
globallogic.com's required tests for authentication.
------

Can you send the patch again and make sure to cc' me explicitly ?

Bruce


> On Thu, Mar 23, 2017 at 4:44 PM, Iurii Mykhalskyi
> <iurii.mykhalskyi@globallogic.com
> <mailto:iurii.mykhalskyi@globallogic.com>> wrote:
>
>     Due to error in naming this service will not be autoenabled in
>     systems with systemd init manager
>
>     Signed-off-by: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com
>     <mailto:iurii.mykhalskyi@globallogic.com>>
>     ---
>      recipes-extended/xen/xen.inc | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>     index 0084274..a28d474 100644
>     --- a/recipes-extended/xen/xen.inc
>     +++ b/recipes-extended/xen/xen.inc
>     @@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
>
>      # systemd packages
>      SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons
>     ${PN}-xendomains"
>     -SYSTEMD_SERVICE_${PN}-watchdog = "xen-watchdog.service"
>     +SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
>      SYSTEMD_SERVICE_${PN}-xencommons = " \
>          proc-xen.mount \
>          var-lib-xenstored.mount \
>     --
>     2.7.4
>
>
>
>
> --
>
> Iurii Mykhalskyi | Lead Software Engineer
> GlobalLogic
> P +38.044.492.9695x3664 <tel:%2B38.044.492.9695x3664>  M
> +38.096.311.5467  S mad-nemoi
> www.globallogic.com <http://www.globallogic.com/>
> <http://www.globallogic.com/>
> http://www.globallogic.com/email_disclaimer.txt


