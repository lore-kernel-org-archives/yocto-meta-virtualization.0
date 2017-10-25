Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0C2C8E00D27; Wed, 25 Oct 2017 08:39:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6320E00D1F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Oct 2017 08:38:59 -0700 (PDT)
Received: by mail-yw0-f194.google.com with SMTP id w2so347946ywa.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Oct 2017 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sngd9f96NE2FhzjHErFVkuCTCklVzVRP9eBYWykZa/I=;
	b=E8NaEf4snPAtUYlr6Sny4GfcM2ugFQESspVGZO0BJqBERyZvRTDBPJ1gfk3Fzo7oMG
	vgULazun4bWoursP0j5llZrzp2SHzM7XP++Iuzn/+DLgAVsAhOSIv9ACt7//6vxGhU2i
	2dszpUCfIQtgMgc1LLjtfr2tnc6czKUjzofa7m4sTaGWXW93dpd7ClqB6reNg+AcM7Gw
	8oh8GM5p+niATR30LFIuffXVi9ApSzg8DzD+5h7LkEe3UOKBtGjYZmG6wmdHDwNRhMFX
	+P+0xnLrx2LWrpPdYoyucWGpKGm6R8/UXHuB/jbZECtv+yXH3mEj02hT+UuK00uYFdkR
	A0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=Sngd9f96NE2FhzjHErFVkuCTCklVzVRP9eBYWykZa/I=;
	b=KsCAsQNJFR0QTi6s445jZrmw9QkltqQlmGbdIHxuoCfvDCi/SKYbIRANwuKpO3Ft4R
	ISp1VolYX5IuJC+/ntAh0wxRvKcwCH1ZY4SuAr4hpn2bRzc5ATRD7nhNvXGUVJO5Gg9B
	kx8E/OQwvuGKRf7OoSKObmY2l2D1KdDwbAibUK8N+ct5kjxZ7sDn4y1+4HUtIshzgKet
	sWrNnjAVqxmuBxCo24Y4srGjnFZjwWMcqlXGwrE6WdcjJnB2JXVITPOSaIArJxjwtfOB
	ug4Vo/dlkBxEa5xzouiv7ywfICqyW/m3s7dP22MeZytitkZsH8eghTiJg/dNqTtUEzpP
	WdOw==
X-Gm-Message-State: AMCzsaWPbDmS2AKNvVFNw7hoqfSsfc8WAGq68W6wu/bwVFgzTlMZvrhj
	g07+3ixY8VtAL5sfNpIV2pYC3dg6hZOPSiyzARM72A==
X-Google-Smtp-Source: ABhQp+SYAIBjFLoHf7OJg3etd3PNlxh2ugidaFd1PIN626WvD6HxpB7JLSSEC2PLHzqyNKRj3B4RVFs6MbnnhsNBzrI=
X-Received: by 10.129.41.212 with SMTP id p203mr12903941ywp.369.1508945939232; 
	Wed, 25 Oct 2017 08:38:59 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.179.130 with HTTP; Wed, 25 Oct 2017 08:38:58 -0700 (PDT)
In-Reply-To: <CAPuovE+89Hd2p-Gza3eZWOSAKZ=p7WQEgOXtkfP9CPDLTm2v1w@mail.gmail.com>
References: <20171020012126.3575-1-kai.kang@windriver.com>
	<20171020012126.3575-2-kai.kang@windriver.com>
	<CAPuovE+89Hd2p-Gza3eZWOSAKZ=p7WQEgOXtkfP9CPDLTm2v1w@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 25 Oct 2017 11:38:58 -0400
X-Google-Sender-Auth: Ohlx7JGEcDbjDXJCmWqqNhA_XKc
Message-ID: <CAPuovEK=+HeV7UKBu=kKXZqAyM=GdARd3EV1FE5VXj6yWPWKVQ@mail.gmail.com>
To: kai.kang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] xterm: remove bbappend
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Oct 2017 15:39:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 25, 2017 at 11:36 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Thu, Oct 19, 2017 at 9:21 PM,  <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add freetype-native to DEPENDS has been done by PACKAGECONFIG 'xft'.
>
> Agreed. This eventual removal (in meta-cloud-services) is even
> mentioned in the commit which added this but no patch to
> meta-openembedded but no patch was ever sent as far as I know.

Struggling with typing today. I meant to say, The patch to
meta-openembedded included a note in the commit about the eventual
removal of this in meta-cloud services, but no patch was sent.

MarkA

>
> Should be good to go.
>
> MarkA
>
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend | 1 -
>>  1 file changed, 1 deletion(-)
>>  delete mode 100644 meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
>>
>> diff --git a/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend b/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
>> deleted file mode 100644
>> index bb8c310..0000000
>> --- a/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -DEPENDS += "freetype-native"
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

