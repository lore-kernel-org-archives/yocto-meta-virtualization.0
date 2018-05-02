Return-Path: <persaur@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50AA0E00A6A; Wed,  2 May 2018 11:30:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (persaur[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4746DE00A1E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 May 2018 11:29:59 -0700 (PDT)
Received: by mail-qt0-f169.google.com with SMTP id j42-v6so19625534qtj.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 02 May 2018 11:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=content-transfer-encoding:from:mime-version:subject:message-id:date
	:to; bh=60gHiY2W+JolIWg7uBcl8wgkz70R998Ack+zT6FLfIc=;
	b=nKlk0SFDt3O+XPCfgEg5Ojbc67qj0hN7scaPcBIAgN88yJO+l8zpf1Kj9bLFHtlySO
	+5m1eBL78mhgXlwgZZh8xXDvcH8XtJMBH37LJ5uNv5igSR04oy8rw2eXZL5q4m+/vU3y
	Ap6R04VXTZyzDFKr82+O2C2Sh9T3ChzCBCO9Vum4ogmp1vXMEimYPXw71UW+//h6Ngg9
	EOvAJIMET1LU9KhbfQJhzmphXUgLX8D+YXTeEOlPwAenuR6hcFj1M/SxAot+57Avd541
	IBD6/OIc/iGrB0bzatoQUuUwNqc7DlXewNtEgZChGX5XSGfdeljzJZOkFLTIObFgIoup
	j4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:message-id:date:to;
	bh=60gHiY2W+JolIWg7uBcl8wgkz70R998Ack+zT6FLfIc=;
	b=XpzGtqzcV/QvxChBQ696lSdOrSt6M3ITIeaYv6sNV80GNYUoD+Wg29cBG2t20uhJKp
	y9CVaBs/guH0TKYhRadXb2AK5IZjzDAjxm5SPJ09VeYCdFlBOxvuIKoeOB5yTZ4dsfOc
	1VV64rfYgcHbJimQ+ygeC+3DeTzG7AHyp4IY16i2fNZP0TvRwvay/jHUNOkCrlkht0D2
	ddkhNylmIEvPsHING/pt5XyMI8oBYQCyo1Ea761KlrryeWuf/XzIEZM2baNAoWiagCHc
	Z+dvjtqD9o+pycN3Vo9pjzOZg/A7COXhPIU7SXvgvRBhOUXcidITIjNFr4DIYj63XH9p
	QQnw==
X-Gm-Message-State: ALQs6tDtlHuuDx1EakBZleg9kUrTbcSaCiXY1WDz/Y7UMlN1VnGwHyhT
	vqc5dFkS0i8Lp8S1MzpjB+Hpwe+PRdo=
X-Google-Smtp-Source: AB8JxZoVIBMJDl11RP3ISF8vBOOqDiwj3ceexJwqaD5rvaBALZw4y0ajP2EJKk0IiHVqOschFmhruw==
X-Received: by 2002:aed:3e19:: with SMTP id
	l25-v6mr16487160qtf.143.1525285798526; 
	Wed, 02 May 2018 11:29:58 -0700 (PDT)
Received: from ?IPv6:2607:fb90:2428:880c:1c30:f738:eef6:e181?
	([2607:fb90:2428:880c:1c30:f738:eef6:e181])
	by smtp.gmail.com with ESMTPSA id
	b13-v6sm7222190qtp.89.2018.05.02.11.29.57
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 May 2018 11:29:57 -0700 (PDT)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <BB3BAB89-0582-47BD-B69F-6B01C6922237@gmail.com>
Date: Wed, 2 May 2018 14:29:56 -0400
To: meta-virtualization@yoctoproject.org
X-Mailer: iPhone Mail (15E216)
Subject: Platform Security Summit 2018
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
X-List-Received-Date: Wed, 02 May 2018 18:30:01 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

PSEC 2018 brings together security researchers and developers from the open-=
source ecosystems of OpenEmbedded, Xen Project and OpenXT, including present=
ations by OE contributors Intel, Wind River and Star Lab.

With a focus on hardware-based security and commercially extensible open sou=
rce, this 2-day, single track event is for hardware and firmware engineers, V=
MM and OS developers, security architects, integrators and senior technical s=
taff. =20

Presentation abstracts, technical references and registration details are av=
ailable at https://platformsecuritysummit.com

Rich=

