Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50C8DE01697
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Oct 2013 02:14:25 -0700 (PDT)
Received: by mail-lb0-f178.google.com with SMTP id z5so541783lbh.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Oct 2013 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=iCPruZuWMe7TwLGuz+m9C71XW4cHw65gWku3vGCIFmA=;
	b=HyVg0JJkKIrn6fSvb3z4GFgWTPU7hfAMpycLmeeqN9mTZbAftT+tKnHT6aEyQIPfZb
	BCc269PYNpf5OklY655t9q3FjmULqmY1nr+SC7WSoZbSVYuLagBGo6IsH9OzP3lBPKbI
	NPL7AeRVp/uNhuvTC4rcYWGsvCXpmQQjkbtoeXZOqkZLNXrTQ29NCbYGn/qzZGsh2Fk/
	bbDfZNlGGJIrb/AdQLJsHMzy20tLZwFkDq4A/zn4Q9wKdYlqzH2u0TQRRVCaRAbNW5v1
	G1hqxahSTNhvzSEx+A2YKUmH9TAIEHdvEQLkDDRCWHUMA2kx0gqzOp52vArw8VccwTdN
	PYgA==
X-Received: by 10.152.171.72 with SMTP id as8mr1068542lac.33.1381310063831;
	Wed, 09 Oct 2013 02:14:23 -0700 (PDT)
Received: from [172.16.140.23] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	ap7sm34319334lac.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 02:14:23 -0700 (PDT)
Message-ID: <52551E5A.4000204@gmail.com>
Date: Wed, 09 Oct 2013 11:14:02 +0200
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Philip Tricca <flihp@twobit.us>, 
 meta-virtualization@yoctoproject.org
References: <20131004163952.GA5669@longhaul.twobit.us>
	<524EF9AE.7090201@twobit.us>
In-Reply-To: <524EF9AE.7090201@twobit.us>
Subject: Re: [PATCH] Explicitly set CHECKPOLICY path to native sysroot.
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
X-List-Received-Date: Wed, 09 Oct 2013 09:14:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2013 07:23 PM, Philip Tricca wrote:
> Probably should add that I'm not very fond of having the path hard coded
> like this. Makes for a dependency on the install location from the
> checkpolicy recipe. For the short term this fixes the immediate issue
> though. Feedback on the "right way" to reference / find this binary
> would be appreciated.
>
> Regards,
> - Philip

I suppose the correct way would be to patch the configure scripts and 
upstream that patch to Xen. But I have no problems with this, as long as 
chkconfig referenced from native sysroot is in DEPENDS, to avoid build 
race conditions.

Br,
David


