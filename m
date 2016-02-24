Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93FAEE007B5; Wed, 24 Feb 2016 10:36:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83199E00720
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Feb 2016 10:36:14 -0800 (PST)
Received: by mail-io0-f172.google.com with SMTP id g203so57542919iof.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Feb 2016 10:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yetryJFHiSUcud6ZmWK/DHcnXiqMKDarQxifF8Afw/s=;
	b=Gx5hoJBq0eEWzOx9ob4rtiUBnKOt3IS4dCQ3q4vV4ygW++zmvCBCzwa7TAi93KJHSM
	jaIYAmqi06UW1hxXFXrxy8O+m9I6b028IW7mVokJ6soN885ckOdjq5XG7q4IY5GnsDe6
	7Dics9MhvKHysgNvDwHA51DDeXr7DEJ3nBBkQD7sHjbx6jw00taAW3vPqpalrcYkeNAQ
	bl4bZfJg3qzvL1mT8EJYY2Pe7G10G80lTyunAJt0wH2Wjeq7DmEeTOrXuX92YCS3Dydi
	agwfbx7zFhwFFJ0E0BHjuW2zoYAJupFx1OjS7R0OFMYCPdZ9lQy3QvGDs/aBj4dGwDIi
	Flcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yetryJFHiSUcud6ZmWK/DHcnXiqMKDarQxifF8Afw/s=;
	b=gPPI6Zv8SZw/tdHU9EgLNhOiM+w2X/bHWyI/Vn44Cllqb3+VglKKAMjQXBpJqdsvow
	LDqiUuEDXtAeZKPDEFkm5ztF5UxNQkhVfh1ngsYhqakz7RZ/jgRIksMlfhJaWopxPQGv
	8FkpwdqsTSGfHxTL9lBD/gLRCJvAbTJsR+L5aXvdYu546B+n8vjnY8OrzpZy2yzkC6k6
	EhIJT0g3ukslk4DC3ZJqbtdKZ9d71Mco1RusZirFHng8Wf0gsjsLniVaQGGD1QxK8Jls
	qHpikheKSZIOASdh96ndRG11+jkWqK0DoC+nhlaI9LGq31aJrQWlvXDImHc6aLZl4Crd
	DeeA==
X-Gm-Message-State: AG10YOTpMHP8g9HPkY3zAUqS9PbtLw/bLvWBfl5qYVJhI7tXSC1cghqGUlUyUHILj74SuKQIvFRWM1auddPF6A==
X-Received: by 10.50.67.47 with SMTP id k15mr23061918igt.18.1456338970104;
	Wed, 24 Feb 2016 10:36:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.98.7 with HTTP; Wed, 24 Feb 2016 10:35:48 -0800 (PST)
In-Reply-To: <CADkTA4NLHMjkY92WYWam7zzPqKXeD_S48bWKvQq3wgvao_20BA@mail.gmail.com>
References: <1455291269-32533-1-git-send-email-cjp256@gmail.com>
	<CADkTA4MW9xP254y=tBQU33pztWGJwqqQUb+BwEApFb3UvUg8Ag@mail.gmail.com>
	<CADkTA4NLHMjkY92WYWam7zzPqKXeD_S48bWKvQq3wgvao_20BA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Wed, 24 Feb 2016 13:35:48 -0500
Message-ID: <CABZSBQc4WpA211+s2bArhf3SmnvcQYiyCFTJKZQqupHgTxTFhw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen.inc: fix ordering of stubs task
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
X-List-Received-Date: Wed, 24 Feb 2016 18:36:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 24, 2016 at 11:04 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> Someone was pinging me about cherry-picking a patch to Jethro, but I can't
> find any trace of that email any more.
>
> I can't even remember 100% who it was, but this patch rings a bell.
>
> Does anyone know of this, or other Xen patches that should also be pulled
> into
> the jethro branch ?
>
> Bruce

It was not me, but this fix applies to jethro as well. I'd recommend
pushing to jethro & master (although you said "merged" above, I am not
seeing it in master). :)

I'm not aware of other outstanding xen patches.

Thanks Bruce!

