Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F280E0146E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Jan 2013 01:20:47 -0800 (PST)
Received: by mail-lb0-f171.google.com with SMTP id gg13so4496725lbb.16
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Jan 2013 01:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RD6Jf1BDKrCQ9CepxZdCIZ7nQ7kobM5AgtQ62JoRjOQ=;
	b=V0Ps17peAP06fmSu1ogzEx46MwjbzYC/t3ClDIOFqrTwGjs3vCf1iXZ6xJvl37WvRj
	lMPL0aZD9jZ2/fkfCBnn6y9r40pwQzZjXvNMfjO91rgP15SV+0LrrNjAAhU/ytOvt+G9
	ZcacMZ273TofvQMCHMRcZ2RG9OuhoFR9nmNM95GJvd8KBsUbGzNuA9gTWL2vlXroVDNI
	SqhbzrHNfEY4CwwGGzlMfkoGc/UoVQMuH7cFm5OWWvcyvReqPMY9Vfqw+ixAtWK8CTOe
	TxXPePKGQW5si3G4f0IhVv7DPgke2hCBTIQF0VBLB6Zq10qYx7QL2jPwYIfaNRIV40k1
	EWvw==
X-Received: by 10.152.105.38 with SMTP id gj6mr642893lab.25.1358932845904;
	Wed, 23 Jan 2013 01:20:45 -0800 (PST)
Received: from [172.16.140.29] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id s9sm7956280lbc.12.2013.01.23.01.20.44
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Jan 2013 01:20:44 -0800 (PST)
Message-ID: <50FFAB5E.2000501@gmail.com>
Date: Wed, 23 Jan 2013 10:20:30 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: lei.yang@windriver.com
References: <1358911691-31413-1-git-send-email-lei.yang@windriver.com>
In-Reply-To: <1358911691-31413-1-git-send-email-lei.yang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] multipath-tools: add multipath-tools recipe
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
X-List-Received-Date: Wed, 23 Jan 2013 09:20:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Wed 23 Jan 2013 04:28:11 AM CET, lei.yang@windriver.com wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> This package provides:
> - multipath: scans the system for multipathed devices, assembles
> - multipathd: waits for maps events then execs multipath
> - kpartx: maps linear devmaps to device partitions, which makes
>    multipath maps partionable
> ......
>
> Now,It can be used for kvm disk img partion mounting for me.
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>

Merged to master,
Thanks



