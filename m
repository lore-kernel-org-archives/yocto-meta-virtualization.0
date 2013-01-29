Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C3E4E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:13:55 -0800 (PST)
Received: by mail-lb0-f170.google.com with SMTP id ge1so783564lbb.29
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=53J81KIG5W5KvQADEL+rh5e7oUHCGLbjgJgA1iy7wB4=;
	b=m/TXzNAkh8aoEQ6ZK2f2erFGwYSZeweGb+p/dk20YlWkpyglqRMrzVP040OlWjW4zw
	isFTcoze91Ti+sXFfW/SEz95XP4NOV5dkKVNui38pn/QHlGJm3P1wxSaKIqNpYQT7a4P
	1Br69jpj0HnenAkRB38do+LcH3REbWgfbZnmwgKM77/N86HRPs2LK9LIn7Vff8KgCsHC
	ipU4FtsH51kQYdK3I6lo4XIInJA4qeSik0tJ/kcsLliy42cM9A73bT6fvd7R1kNyFhOr
	xcukZ4/sSoco70zFxiJ059VhM/wZc643SYDxnBYY2+coYWMRZWNt83RI5538gt+w6Ult
	IGzg==
X-Received: by 10.112.43.198 with SMTP id y6mr542300lbl.93.1359468834461;
	Tue, 29 Jan 2013 06:13:54 -0800 (PST)
Received: from [172.16.140.31] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id ew10sm5153422lbb.10.2013.01.29.06.13.52
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 06:13:53 -0800 (PST)
Message-ID: <5107D91C.3090504@gmail.com>
Date: Tue, 29 Jan 2013 15:13:48 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
In-Reply-To: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] iptables: Sync bbappend version with oe-core
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
X-List-Received-Date: Tue, 29 Jan 2013 14:13:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2013 02:01 PM, Mihai Prica wrote:
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   recipes-extended/iptables/iptables_1.4.15.bbappend |    8 --------
>   recipes-extended/iptables/iptables_1.4.17.bbappend |    8 ++++++++
>   2 files changed, 8 insertions(+), 8 deletions(-)
>   delete mode 100644 recipes-extended/iptables/iptables_1.4.15.bbappend
>   create mode 100644 recipes-extended/iptables/iptables_1.4.17.bbappend
>
> diff --git a/recipes-extended/iptables/iptables_1.4.15.bbappend b/recipes-extended/iptables/iptables_1.4.15.bbappend
> deleted file mode 100644
> index 52a4c4f..0000000
> --- a/recipes-extended/iptables/iptables_1.4.15.bbappend
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
> -                      kernel-module-ip6table-filter \
> -                      kernel-module-xt-tcpudp \
> -                      kernel-module-ipt-reject \
> -                      kernel-module-iptable-mangle \
> -                      kernel-module-xt-checksum \
> -                      kernel-module-xt-state \
> -                      "
> diff --git a/recipes-extended/iptables/iptables_1.4.17.bbappend b/recipes-extended/iptables/iptables_1.4.17.bbappend
> new file mode 100644
> index 0000000..52a4c4f
> --- /dev/null
> +++ b/recipes-extended/iptables/iptables_1.4.17.bbappend
> @@ -0,0 +1,8 @@
> +RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
> +                      kernel-module-ip6table-filter \
> +                      kernel-module-xt-tcpudp \
> +                      kernel-module-ipt-reject \
> +                      kernel-module-iptable-mangle \
> +                      kernel-module-xt-checksum \
> +                      kernel-module-xt-state \
> +                      "
>
Merged to master,
Thanks.

//DD


