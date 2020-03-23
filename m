Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.48419.1584953467778856872
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 01:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=n2UjJAgm;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=952; q=dns/txt; s=axis-central1;
  t=1584953468; x=1616489468;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lvEo1MN1vfJ4w/8poU/ChS/I6ttXgrr9q/YvhVkYTjI=;
  b=n2UjJAgm1hWfJ2sST4JbUItnaksGcq6Fe5FQbdIH6XkfC4w9zAxQMB2N
   UpEourYQNSsSDHSGU2r+1WqKKci9jvjjZ1g3jx8CXKiOBRcnBW6YU7Q2/
   2euu2776K1MDJzipdPHzmN0+w+6xbIrbKsBb2ebztCTjBh6IZuf3uHhqu
   mDle/jprLjO5vD/Q2kHpvPwIEATKPz4sesaS3/767F/nv/JdFQW9OOa1d
   jeOaai1mk4XVPbCmg/6ac8NfcEYT3/RO0Lg2mXXNrFLU7Q7hg1IYLJtpO
   2jKoWYqgHfE+HbLSRMe1d0GzfxuvkHiPTaA6q0uPGszLNoAwOyfGMBCi8
   Q==;
IronPort-SDR: pH7m9vy3A7hUR9f6ArioAH/h2yIYCvYVFr0rp1SKTOjYTNpTTmSld8mrGAUR8qkJYgT3lOFp/k
 mowB5TNLId/ewWaklBe1Q/WypW7OJk/3RWqkGSsI/keU7JdZpsA5M965NB0FiOcaMrdry7nYkI
 y1Y7t2dACloPEw+ziSYta17a8PFBlp/ba525YvwuVL9hRpqKn8ZFC4ALuKfGLuAfJQlBRmJyBi
 Fk7yWqKFKUBiLSBRYjiSkbgiPCWVbxZAyjwtyT2t7CRAPaeIeLOvLFiO20TeQdDnGpUJx3W6iu
 KFo=
X-IronPort-AV: E=Sophos;i="5.72,295,1580770800"; 
   d="scan'208";a="6619328"
Subject: Re: [meta-virtualization][PATCH] go: Enable different target dir by using variable
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <20200320095124.3297-1-joakimr@axis.com>
 <7eba015ce34d41618ff6ed2d738b1696@XBOX03.axis.com>
 <CADkTA4P+oixEyD1XU9BuERrdTPHCFoPt-RCJNEwzt41Dhg_ghg@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <d237395c-a7a0-b647-3fb4-8088b87cd313@axis.com>
Date: Mon, 23 Mar 2020 09:50:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4P+oixEyD1XU9BuERrdTPHCFoPt-RCJNEwzt41Dhg_ghg@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2020-03-21 18:10, Bruce Ashfield wrote:
>
> Joakim: is this what is happening to you ? They are in the DEPENDS,
> and hence get the PN  RDEPENDS, then are installed to target, and that
> is causing you issues ?

I am working in a build environment set up by Peter & c:o, where there
is a hook run at the end that will fail if a package installs things to
/usr/local. For me that is an issue when I build docker-ce, since
docker-ce will trigger these go packages and I need them not to put
anything in /usr/local for the build to pass that check. From my view,
it does not really matter how things are solved, as long as I can build
docker-ce. Which I cannot with the current meta-virtualization in our
build environment.

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

