Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D362410706E6
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 15:19:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11699.1773501595345368632
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Mar 2026 08:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QGhvotxU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso19031275e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773501594; x=1774106394; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0TJf6VWWLa/OJ+HF2xA9HMgP2NvGrjoAeO0AnufpOH8=;
        b=QGhvotxUKsPiMyhNeGhfOSYy3E9QsnC9P2JkwKTWJUOH0DNBcyPscZq9r9gn5JYnyU
         Ex4eqdROrR1TPBJO+Jjo7v73eSPANKZEAGzxuGdhPFmtAbCii7r92Ys85GPx4PtAdcK+
         HPtT32ovqdL4cr3NCKoNtjiLSBdnuvL5BVjoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501594; x=1774106394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TJf6VWWLa/OJ+HF2xA9HMgP2NvGrjoAeO0AnufpOH8=;
        b=nwVzFC/YJJxNgLYBv9tZkNUKETI2k7OaQM6TylHj6UvY4vNovWZkW92VJNaz+D2Fi5
         K+yd9eOHjltIEpwkUr3Bs4fUGwp6sjSIV5GrA8nNTehHYalkvO4Hmqh+FCEjfPDeGWxS
         nHdgcouaOW3+2iM5YcwjaE/4cNhYnKjJ1YxzuzimtwtKweUe+mhAyoDNxpX3wJgmtwjf
         M4J6NVzYpmKCgpcNjZNPP8uPMYD9QiZW6QcArqKUNwn3u/yY+u3BYJlLFDXWso8ArltH
         rkcw96Q5yfwBP5fAQ22BbL9wyclA672rMpaADPtP9mesSRzkCXyJl89NE/1B4OyXtQYc
         Ll/A==
X-Gm-Message-State: AOJu0YyBo7Ejm5b5ahBogBcqey4yU/tX6xbSA30ci2OQyIrpPp2eNVLf
	XLKGageKbaa08KTVDTL8h3R65aNL33wG5EQGV5xBnKCFq4TCceW1mOmyOfEBrMiEFRE=
X-Gm-Gg: ATEYQzyKU25BgTZWx8LQ8BYO+ZEHEZhQg+fZhpxp+UJ4mC8Hcuztt8yIHPamwpyAVfs
	ypbNUW26hUsjws5lddZ3Yqbwh/0BAqWwMjigEHXTnknEinokb3BQ6prqLrZg/EIvfM8az/6evO8
	03ivh3AqZVUYx+ZOYH33+RFdO1jxNp8GQBn4hSctA3c+TMGcNfReXC/dtZytUQJWFvq96IiVj0V
	MmYEM+WZKde4du9Bywkius1jOwmyzeJpdqv9fHC7jpfVYeh1gupacL7zxiu0XyH8pVoHuNb0wfn
	9S/8paRuaKzqs6C7XxmzGzaN3NMMzrQkJslzFPbF1Gsd1pUsFFEPvmFMmhPAXJLPk55kyLFKODh
	r6Yeac8CBUMLJOYkobOViHkQktrWeS50188P6nG2hOsjTpEvIg9sbfL3V7ZSqxWOQAIlkBn6shi
	Ebb0wYCY42G+NV8xOwXvl/g6AX+5qMJiW+BmIb6GPRmNmyP/h0vleoUUYw75RSNMgZC60aMz56q
	ozU6Ds39rMi9fKKeAMSvLfKQg==
X-Received: by 2002:a05:600c:8b55:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-485566fd0dfmr109808795e9.21.1773501593657;
        Sat, 14 Mar 2026 08:19:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1366:c81f:8eb8:9990? ([2001:8b0:aba:5f3c:1366:c81f:8eb8:9990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6070acsm246244225e9.8.2026.03.14.08.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:19:53 -0700 (PDT)
Message-ID: <e53253ff66148e4384bb9963ea6d0c08bcecfbe8.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization] [PATCH] container-dummy-provides: Update
 to match changes in oe-core
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Sat, 14 Mar 2026 15:19:52 +0000
In-Reply-To: <abV8SmQXZZB1xO80@gmail.com>
References: <20260314103109.3942620-1-richard.purdie@linuxfoundation.org>
	 <abV8SmQXZZB1xO80@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 15:19:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9660

On Sat, 2026-03-14 at 15:18 +0000, Bruce Ashfield wrote:
> merged.
>=20
> Hopefully this is ok without your corresponding oe-core change.
>=20
> I didn't see any issues, so I've pushed it to master.

It just sets extra values so it should be fine, I'll hopefully get the
oe-core bits merged soon too, thanks.

Cheers,

Richard

