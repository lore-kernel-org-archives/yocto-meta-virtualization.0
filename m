Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF1F9E0047F
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 04:15:01 -0800 (PST)
Received: by mail-vc0-f180.google.com with SMTP id p16so19419683vcq.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Jan 2013 04:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=V0DBJsQiWbrOhPtQAz2FsbtZq5IVo03dXlZTDEGbDFM=;
	b=NVdoyfgJi4xboe4nlWJZ31ubmj3zUmUh4mK1RCgjrkWcXx2eNZIpM+FSl7qBihpRo5
	gLm2g0NOrA3RLLIzOHOt4eef8B3j7k1CAf2MKsDvOyjiOG4qoxjWvrpEAZQGLNGrXnIF
	okXgLPAaxpkIBnvrvS+z92PBoA2euDs3MxtsXU9lHUxeU8F6RybV7S0OXSnmJN6rOUsO
	BUpYD/d6uXMUVerIrdvMPRqeU36P3fWFSly3jZiWTGjmXgDiRV3DbBJBa6NgeRAkdAHX
	LrYA/X5pFLPI9PsALHF5rQSybClA5Y8lvlbu+CqM59VvxVu7CjMhHZY21WNC7nM6TCdY
	x2xg==
X-Received: by 10.52.156.72 with SMTP id wc8mr72006476vdb.77.1357560900320;
	Mon, 07 Jan 2013 04:15:00 -0800 (PST)
Received: from [172.16.140.44] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id q13sm51736112vdh.22.2013.01.07.04.14.58
	(version=SSLv3 cipher=OTHER); Mon, 07 Jan 2013 04:14:59 -0800 (PST)
Message-ID: <50EABC41.1070201@gmail.com>
Date: Mon, 07 Jan 2013 13:14:57 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
In-Reply-To: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 0/2] KVM integration
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
X-List-Received-Date: Mon, 07 Jan 2013 12:15:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/07/2013 01:08 PM, Mihai Prica wrote:
> More details on building a KVM image can be found on the wiki page at:
> https://wiki.yoctoproject.org/wiki/Virtualization_with_KVM
>
> Mihai Prica (2):
>    linux-yocto: added kernel configuration for KVM
>    Created new target:kvm-image-minimal
>
>   recipes-extended/images/kvm-image-minimal.bb    |   22 ++++++++++++++++++++++
>   recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
>   recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
>   recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
>   4 files changed, 31 insertions(+)
>   create mode 100644 recipes-extended/images/kvm-image-minimal.bb
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg
>

Reviewed-by: David Nyström <david.nystrom@enea.com>

