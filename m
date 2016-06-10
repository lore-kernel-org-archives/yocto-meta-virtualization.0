Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F917E00DEF; Fri, 10 Jun 2016 11:40:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BA61E00DED
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 11:40:49 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id h68so6741062lfh.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 11:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rbbnkG6tqKhyhtfM6fKZLt4bHzz3FY26UNYhMZQS0+k=;
	b=E8nmpQmAoq1Nj4Xi61AwxEi+On2I1TqS2ReNF0L/47c9KQ++g9ZxFgMTFsI6sHvEEY
	Mpn4f4gB/4WtdWrslcN/0Yc17XWsUpVWUArnmuxC5UHVKzkDb2RR8hNvsFTYjhwuH9td
	LndcqdNYUdgtmqzmBtWIu/1G244UsBQuTJuQm2xrgx3VJcAn5LxQg8OWkLGSBRs0q4My
	bab3YkUO8NZEtoiEZFU8Snetjqar+3Qj/r7FuVeluIftNGHvRJX4uiudELiMQeZ1aHIc
	ppJkLMKytzLEBq7+TKGPcw7IdtWLcFQHAPxlDDSPHQiBUSh0sx3a36iyzXTV9iF7zdjF
	Nnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rbbnkG6tqKhyhtfM6fKZLt4bHzz3FY26UNYhMZQS0+k=;
	b=NH3VcA4S1BodSzvdUOI2JYI8z6Kbnr/0m3xmRNKJz0QJHlVdRX1H+QFI47Uo/0xfww
	G8qojrZOZTp+Uw9DCj3NS+uH8Pl8Yvnsci8SzkI8R9SKoVscCYl2SYwt2Vb0PfLf3F5U
	pJhWjR9nXMEWH+6curRTFYqKUNFZeqTyQyvxaNVGS/XIPHM7VbVnorl2X29LiajF0IFx
	/X2YBM/E7lhDjVM1M56K7Uknw5GijwghrbwzNeCNwcPRxEbESm/hkUZqVEcV9dbtwFKG
	jEplMhh51A8MFTDwyok4504EIJGN1bvfu+/7ffNBrynNwFzRsooLUvzh0pQhZ0+lAz0r
	UQaQ==
X-Gm-Message-State: ALyK8tJZeMO347YypqSk0exizc6Ud0Izyt5qhPCEjNiv4DF6lf0GBBqZw1FhXJ7JQ6EOOkuHkCDx/g8h8SnfHw==
X-Received: by 10.25.149.19 with SMTP id x19mr876258lfd.0.1465584047160; Fri,
	10 Jun 2016 11:40:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Fri, 10 Jun 2016 11:40:17 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <CADkTA4PgXwQwffnXCTxzy9++px_Tc4JdoN9vU74K6HN_Ds6=RQ@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
	<CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
	<CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
	<CADkTA4PgXwQwffnXCTxzy9++px_Tc4JdoN9vU74K6HN_Ds6=RQ@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 10 Jun 2016 15:40:17 -0300
Message-ID: <CAAPZna372EhYt_3xzb_4HZTJo00Mk25FyL_pkUkKySYvvdk17g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [krogoth] Golang errors when building Docker
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
X-List-Received-Date: Fri, 10 Jun 2016 18:40:51 -0000
Content-Type: multipart/alternative; boundary=001a11401c1885148c0534f0e018

--001a11401c1885148c0534f0e018
Content-Type: text/plain; charset=UTF-8

I'm working with Krogoth and cherry-picked commits from master:

677f359 go-cross: allow tmp directory to already exist
3a45dc4 go-native: don't use host /var/tmp for temp build artifacts
f17e1ed go-cross: don't use host /var/tmp for temporary build artifacts
fb7349e go: add go-cross 1.6
d687655 docker: drop obselete dependencies

It works fine and I don't get any errors. I think this commits should be
backported to Krogroth.

--001a11401c1885148c0534f0e018
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">I&#39;m working with Krogoth and cherry-picked=
 commits from master:<br><br>677f359 go-cross: allow tmp directory to alrea=
dy exist<br>3a45dc4 go-native: don&#39;t use host /var/tmp for temp build a=
rtifacts<br>f17e1ed go-cross: don&#39;t use host /var/tmp for temporary bui=
ld artifacts<br>fb7349e go: add go-cross 1.6<br>d687655 docker: drop obsele=
te dependencies<br><br></div><div class=3D"gmail_default" style=3D"font-fam=
ily:monospace,monospace;font-size:small">It works fine and I don&#39;t get =
any errors. I think this commits should be backported to Krogroth.<br><br><=
/div></div>

--001a11401c1885148c0534f0e018--
