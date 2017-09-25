Return-Path: <persaur@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A20FE00D0D; Mon, 25 Sep 2017 05:00:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	MIME_QP_LONG_LINE, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (persaur[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22B85E00CD5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 05:00:42 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id o3so4768346qte.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/HDbQCTnD/Zs3hxHN3iMEdOv95txogsQck4WjkqQoIY=;
	b=JNRExQUGb5tkYH9+V/aLjTtnK7zmb+IVJ6PkT9CyAhMh2fW8y70JrGEh/e/rx1GSB3
	46M3KmyXm/nOx+wu925eQQdjE1GldMAC7+d9IF474B47uEjNq5+aOx/6Ml3oHTMc9K7u
	CWwQVBUMttp+kwYbKl5s0UnhRWVQ5nLvT0OiivXYz9FR6cdkJb2NLF62cIjIvgfJ56G/
	1HzKRLSla2g3lVdaJ/4LvaxTettkjpoztS8ZgdSeRAUXeZvsRO3vMmTDj/Q25ZU9CBIc
	dDhKf7RKPFNevC3+Lt0G4NesFeQ5vYMrhzmlYFOskF4YZSzw5TLtRwrib/depkE7sUnv
	hjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/HDbQCTnD/Zs3hxHN3iMEdOv95txogsQck4WjkqQoIY=;
	b=mPoM6HfRm3bQFD7WtosTTNOD1HvzJQ9q3Jo9SHVlTBotSbJO/ozWSXBCDim7d/DlRL
	tOFVhZ9f3Qxf/E0Y1mRdDzVjkMRVc0OVHq11iS7dqjDtbL/ydcWTbuauO+5xUKZavFX+
	4e1aTWbF6MwGNO8jXdgyNWNVqe70UBbesszuWRyqywzDr/e+4/wfrL0W7TFLb6VlHoHN
	QGBDZlfB1oztJA6fceBzl/AvreJa2eShbh0keoJgdeUv0x8AwR2mhtxN2GBvz4GjNm0n
	F1Wu+d08bs5xSLKZd6wjxJvuwZKPhcf1zdFXUKPSvJ45mEYrlpce8vHFjmMppSsAg5qm
	C5Cg==
X-Gm-Message-State: AHPjjUhvtaZNQmoDElRYesgpT/LlSpyrwlfV2RBhmYfY9AZ8mym3gaVd
	udDjSzjpGN11ThnXqTlrQZ7my/po
X-Google-Smtp-Source: AOwi7QBefdfCqjaP96N/0w4RZJRL1SgWraYnAfRoUOv3vTfwqpp9rIRBcej1SIDw8E1DW31D5n/D0w==
X-Received: by 10.237.57.135 with SMTP id m7mr10221968qte.4.1506340841726;
	Mon, 25 Sep 2017 05:00:41 -0700 (PDT)
Received: from [172.20.160.153] ([173.245.215.240])
	by smtp.gmail.com with ESMTPSA id t3sm4011946qtd.8.2017.09.25.05.00.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Sep 2017 05:00:40 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (14G60)
In-Reply-To: <1506336011.31732.13.camel@linuxfoundation.org>
Date: Mon, 25 Sep 2017 08:00:39 -0400
Message-Id: <8C5544EC-5FF6-434A-8589-62C3DF47867F@gmail.com>
References: <20170925084113.30094-1-Qi.Chen@windriver.com>
	<1506336011.31732.13.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2 1/3] sanity-bbappend.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Mon, 25 Sep 2017 12:00:44 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-11505012-CC28-4DF7-B293-8850EF280475
Content-Transfer-Encoding: 7bit

--Apple-Mail-11505012-CC28-4DF7-B293-8850EF280475
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Sep 25, 2017, at 06:40, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
> ...
>=20
> So yes, I think there is a valid issue here and in many senses, YP
> Compat v2 is probably highlighting a real problem but I suspect this
> patch series is not the way to fix it...

Are there docs on YP Compat v2?  A web search turned up this RFC:

https://lists.yoctoproject.org/pipermail/yocto/2017-February/034489.html

Rich=

--Apple-Mail-11505012-CC28-4DF7-B293-8850EF280475
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><div></div><div>On Sep 25, 2017, at 06:40, Richard Purdie &lt;<a href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:</div><div>...</div><blockquote type="cite"><div><span></span><br><span>So yes, I think there is a valid issue here and in many senses, YP</span><br><span>Compat v2 is probably highlighting a real problem but I suspect this</span><br><span>patch series is not the way to fix it...</span><br></div></blockquote><div><br></div>Are there docs on YP Compat v2? &nbsp;A web search turned up this RFC:<div><div><br></div><div><a href="https://lists.yoctoproject.org/pipermail/yocto/2017-February/034489.html">https://lists.yoctoproject.org/pipermail/yocto/2017-February/034489.html</a></div></div><div><br></div><div>Rich</div></body></html>

--Apple-Mail-11505012-CC28-4DF7-B293-8850EF280475--
