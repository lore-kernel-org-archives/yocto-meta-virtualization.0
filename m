Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6BCAE00AFD; Sun, 26 Mar 2017 23:49:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM,T_DKIM_INVALID
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.180 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.180 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_DKIM_INVALID DKIM-Signature header exists but is not valid
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98A68E00A9A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Mar 2017 23:49:29 -0700 (PDT)
Received: by mail-ot0-f180.google.com with SMTP id t8so19791084otf.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Mar 2017 23:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=ojyKQnxG5hIHHgZyunTLitx+MX9QvkjVWbj04fK/TUo=;
	b=NjVAyaAqTVtl/dtV4PznjvcLR7JE6qTpBKJYgO1EmN9YCrRW5H4JLWEapfAhmwEe+v
	rpyuCrl5wcNEbDQ4o8d3DDA7c+J1UQUNuFh1KISDTT2ftyphLlZ4NgddqWP8m7XTvnt5
	C/TSo8g9/AOBxXEnNY3BjGKHy7gwmL/atyKGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ojyKQnxG5hIHHgZyunTLitx+MX9QvkjVWbj04fK/TUo=;
	b=BNr3jTJ1zDAUpxjAcmcrNY5bIiq1HIt7IWptd5MIvEKYKoZpcoJvQ3ZYqgwVH0+jTO
	ogeVSRE1se4gDtnxGucLlmgQ+Y0uxG2tTGWslQxl711l83ERQjqUkH7QUU9Aope5BTAW
	dnUdX/srjT3IkCisCvEW/nswcpgdWOa9sEEQtMW9Z5g+50jr+62jE1CvZpnlIIE/MGxF
	nffsvNFCPOzUCBmNPAH3HRXZ1R/uCkzoljJWMJZhytq+WKT7Koz2mQ/8f9bGltpf49Uj
	qq6GYriSX42rk/eRHJySGLiVbRebxROWQI6eR1RbY3wTFrk5XsmUN6I4j7Ufe7nEXw8y
	aR8g==
X-Gm-Message-State: AFeK/H04XIIu+VKSFKuOGcCCc7Mzj0XwCBF1glbEax5tRL2cvrQ3UzE7otgr883McyzYXngFPeDRPt3YwLRY+6Uj
X-Received: by 10.157.34.107 with SMTP id o98mr43791ota.208.1490597368680;
	Sun, 26 Mar 2017 23:49:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.80.145 with HTTP; Sun, 26 Mar 2017 23:49:28 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Mon, 27 Mar 2017 08:49:28 +0200
Message-ID: <CAFL6qn5NxqSjVxZnh6mwXvTK3gw3MQB=VZtqyU=q9cS1s033Zw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Virtualization support for ZCU102 on Morty
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
X-List-Received-Date: Mon, 27 Mar 2017 06:49:37 -0000
Content-Type: multipart/alternative; boundary=001a1136e1d0a9e92e054bb0be62

--001a1136e1d0a9e92e054bb0be62
Content-Type: text/plain; charset=UTF-8

Hi,

Is it possible to build a xen-image-minimal (that requires
meta-virtualization support) for ZCU102 board using Morty branch of Yocto?
Is there in this branch enough virtualization support for this board?

Regards,
Pello

--001a1136e1d0a9e92e054bb0be62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Is it possible to build a xen-image=
-minimal (that requires meta-virtualization support) for ZCU102 board using=
 Morty branch of Yocto? Is there in this branch enough virtualization suppo=
rt for this board?</div><div><br></div><div>Regards,</div><div>Pello</div><=
/div>

--001a1136e1d0a9e92e054bb0be62--
