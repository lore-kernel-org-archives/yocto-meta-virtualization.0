Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF3F8E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:38:46 -0800 (PST)
Received: by mail-lb0-f180.google.com with SMTP id q12so720386lbc.25
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZlS/MlQc2EdlpZzFsjHEpv6Ys0b8KkBwEIE+ecMNhlw=;
	b=h0mCTEHbYNGE3B7Ke/eCxOR5/3Wgxv/4uzpPwTZl4cpOwJVstpterB22BbPQyj52Hv
	T36vngdlD5w09i70yp5WIWmjDmuhmcL9riEwoMSEXpbmg439xRveGySxUXbFygOKhEYE
	Nol9bTDQVpIxyLzWnr/eGFpwFyTJCvHVuD7HwLQa8nkEnU7sAPH5BVyoTFTGHdoZKY3L
	TpsgPi0YNbA0aAAPDfV6PKdGzb8IhT+KrRlSE5Z57fB7IHxNuL1Kzz2te+Zz5kkPLL6Y
	sEAjff8zNda3yCLMKlQRE8Kz9MBZAuMW8Nc0wSQZOThGi+auMoQ/GqAZ5BwHVknzNRp3
	ZpPA==
X-Received: by 10.112.10.39 with SMTP id f7mr512452lbb.41.1359466725411;
	Tue, 29 Jan 2013 05:38:45 -0800 (PST)
Received: from [172.16.140.31] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id pp13sm5037577lab.12.2013.01.29.05.38.43
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 05:38:44 -0800 (PST)
Message-ID: <5107D0DF.6040006@gmail.com>
Date: Tue, 29 Jan 2013 14:38:39 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
	<1359464500-16993-2-git-send-email-mihai.prica@intel.com>
In-Reply-To: <1359464500-16993-2-git-send-email-mihai.prica@intel.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] qemu: Enabled VGA output
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
X-List-Received-Date: Tue, 29 Jan 2013 13:38:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2013 02:01 PM, Mihai Prica wrote:
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   recipes-devtools/qemu/qemu_1.3.0.bbappend |    3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 recipes-devtools/qemu/qemu_1.3.0.bbappend
>
> diff --git a/recipes-devtools/qemu/qemu_1.3.0.bbappend b/recipes-devtools/qemu/qemu_1.3.0.bbappend
> new file mode 100644
> index 0000000..2106825
> --- /dev/null
> +++ b/recipes-devtools/qemu/qemu_1.3.0.bbappend
> @@ -0,0 +1,3 @@
> +# Enables QEMU to display the VGA output
> +DEPENDS_append = " libsdl"
> +SDL = "--enable-sdl"
>

Should this really be in meta-virt, this seems a bit distro specific ?

Br,
David

