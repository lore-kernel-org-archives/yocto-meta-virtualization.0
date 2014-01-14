Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B2E3E00813
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jan 2014 05:47:46 -0800 (PST)
Received: by mail-lb0-f178.google.com with SMTP id u14so2407993lbd.23
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jan 2014 05:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L1uWcLLKGUOcyBjf7uQDvSuWMgy5sK/E+GE9ZGlggFI=;
	b=UdiHQ9wdMTlFOt9D9Zg5yDjgmfcMo7tCu+Sd4pwSREKr2p/GtsMQCOqojHPc+rf2GS
	ZldyZAjGToxk9jgrcb+MJbf1Wa3KZLW1t/3R3CQzfVQZp7SURe2uHIEmrynpwvq1hUS1
	vTrVlgBFgKxcoqU3u+rBX5Moi45swWgBmAHeSAhAGrkJ+duc3llr+HpTqZiYRKNVm/Ee
	abNPzmal1dAKpaiqeYCOdAXjGO5Wu1oMo23ASGikaM8qKRQ2iS6t0LCrssotprQchSxL
	HKEBR6fenxb6lJOtXozuprA4xcxcgRn++zMZCllsRmsgnbn6/eGRpMnRMOcbV8fC14ma
	7qFQ==
MIME-Version: 1.0
X-Received: by 10.152.204.39 with SMTP id kv7mr925570lac.42.1389707265458;
	Tue, 14 Jan 2014 05:47:45 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Tue, 14 Jan 2014 05:47:45 -0800 (PST)
In-Reply-To: <1389642122-32348-1-git-send-email-kergoth@gmail.com>
References: <1389642122-32348-1-git-send-email-kergoth@gmail.com>
Date: Tue, 14 Jan 2014 08:47:45 -0500
Message-ID: <CADkTA4MZmW9NkJH=8nfnxJTCUJ6_CSqa4UgQvfc3WjBU+gC4Ew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] iptables: 1.4.19.1 -> 1.4.21
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
X-List-Received-Date: Tue, 14 Jan 2014 13:47:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Applied.

Thanks Chris,

Bruce

On Mon, Jan 13, 2014 at 2:42 PM, Christopher Larson <kergoth@gmail.com> wrote:
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  .../iptables/{iptables_1.4.19.1.bbappend => iptables_1.4.21.bbappend}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-extended/iptables/{iptables_1.4.19.1.bbappend => iptables_1.4.21.bbappend} (100%)
>
> diff --git a/recipes-extended/iptables/iptables_1.4.19.1.bbappend b/recipes-extended/iptables/iptables_1.4.21.bbappend
> similarity index 100%
> rename from recipes-extended/iptables/iptables_1.4.19.1.bbappend
> rename to recipes-extended/iptables/iptables_1.4.21.bbappend
> --
> 1.8.3.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

