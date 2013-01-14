Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12B8CE0047F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Jan 2013 05:07:12 -0800 (PST)
Received: by mail-lb0-f179.google.com with SMTP id gm13so2936713lbb.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Jan 2013 05:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=b711+ziCfZVH+4RvRdzd/PZhqKekS0N3mFUUR3q/Hy0=;
	b=QqZk/ebC6/416MWGdfoe1NwWUUm4UgaA/q/YtmQ8zhreuyx9wXEMdKP+A3jv/maHwj
	fsTNVnRioQCuRbdi8CFVBzH1CyvCjNB8n0/rCwLqvqO70VpTulweN+igvNl7gxVgL2fm
	w+GHLvqqP2fySWvpgTbsIcu/NkROhWe6eYyiBnp4Dr2wIXO1K4F/4HEFK7qDfDfD+GUx
	w2giO+XcWUGWzNtUtYcJaUBKCp2rJhOqhAHqB8r/e0c3pQMkghttNCvZTB0cFwwqUBv5
	z4gsDi6thcfpnak6ij9/ALumrTeby8DZUBL6IKfP5Mtp8lFmHfHP+2X0d+XNCRq2cTeq
	tDAQ==
X-Received: by 10.112.25.198 with SMTP id e6mr35677309lbg.63.1358168831599;
	Mon, 14 Jan 2013 05:07:11 -0800 (PST)
Received: from [172.16.140.29] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id v7sm5323710lbj.13.2013.01.14.05.07.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 05:07:10 -0800 (PST)
Message-ID: <50F402FB.304@gmail.com>
Date: Mon, 14 Jan 2013 14:07:07 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <1357921745-18046-1-git-send-email-mihai.prica@intel.com>
In-Reply-To: <1357921745-18046-1-git-send-email-mihai.prica@intel.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ebtables: Fixed typo in RRECOMMENDS
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
X-List-Received-Date: Mon, 14 Jan 2013 13:07:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2013 05:29 PM, Mihai Prica wrote:
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   recipes-extended/ebtables/ebtables_2.0.9-2.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/ebtables/ebtables_2.0.9-2.bb b/recipes-extended/ebtables/ebtables_2.0.9-2.bb
> index 15213cb..66c7b95 100644
> --- a/recipes-extended/ebtables/ebtables_2.0.9-2.bb
> +++ b/recipes-extended/ebtables/ebtables_2.0.9-2.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/ebtables-v${PV}"
>   ASNEEDED_pn-${PN} = ""
>
>   #Load the necessary kernel modules
> -RECOMMENDS_${PN} += "kernel-module-ebtables \
> +RRECOMMENDS_${PN} += "kernel-module-ebtables \
>                        kernel-module-ebtable-nat \
>                        kernel-module-ebtable-filter \
>                        kernel-module-ebtable_broute \
>

+1

