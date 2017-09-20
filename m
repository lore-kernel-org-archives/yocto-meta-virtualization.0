Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1DDAE00CCC; Tue, 19 Sep 2017 17:23:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.48 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.48 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 463B5E00C14
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 17:23:11 -0700 (PDT)
Received: by mail-pg0-f48.google.com with SMTP id i195so733637pgd.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Be9nblEvV1nw1wnFIL2z5ZAMzjbi4CGyDEHreWvMxTQ=;
	b=eudlK3dXeHOsMWRnDNeJfbxntomtn+Pl7eSrO+9bz3Nj2ID2hp86jnrUuDUtPs9m+c
	a+MS7wElFgCO3T7itL3Ywcucs5k5TWQ83bKtM5oQcijwKhVaxj1wNdBCIh6SGgP7BrnC
	qfBi9KUcqJ0FgcqwzucUWXTQtmrkWQ5QpGAukEde5b3yM65FWtIjf6Hrfu+uUHMDEUPX
	D7GntBTsi2BgBNk9Vk1KI8/3ygWFX8H0zJBreiWz3wWjenQdiMw70jBksLhavYjmETAI
	A5pgEiTW9TzVKTVQMY8Gn8sNvpv6+cg+VgzcaaQ/46aH0Q2AwcF3j+iy4rh2+0bvxZzZ
	ouiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Be9nblEvV1nw1wnFIL2z5ZAMzjbi4CGyDEHreWvMxTQ=;
	b=Rp5ml+llwXAlD5xDL+iGs2HVPHvuZaiZzuSfwDXONSC2dHIqdyibED7eJ8AGS4qiBW
	dlzKJ/I4jbQIM3RueUUq6tF1A+yhOZW56JPVNPS6X7Rxh+/vfxCbYNbYkqpqBx/Og/fb
	GG7gh8Z7/634ABC0JvRazfqYLATpOt2GlzHnJLeAOCIMwqQJUaSnB0pge3ME8oFUXpgi
	jqfIQDKT4BaCVeQFcPZvi+ZvJHUU8MXjdcY05WiKZcV5xFlux2xBDf8E+imC8/njCWQR
	Ht1n+qEHo9SuFj1OavqANbfyW3iN+l0lhWG/OX2RCfUrEjvWeu8VK6BhdCeLf8sbVdz/
	430Q==
X-Gm-Message-State: AHPjjUja8qaFO/YlsGOfew+fw8Q5P/s2JKkdn5P0dgnlsfl9RbTUHGaH
	4PLTWgEZMUJBmYAzfeigj4EULGf8/qOFg1V66f/SSw==
X-Google-Smtp-Source: AOwi7QB1JZBOP5B8LqVnhhBDzLzuX6xyzHUpPrAWSstKai7IW6kPzTbWfPLikbc0nRTakQc5g4j95vFGeau28jwptpk=
X-Received: by 10.98.72.83 with SMTP id v80mr380473pfa.54.1505866990790; Tue,
	19 Sep 2017 17:23:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.130.151 with HTTP; Tue, 19 Sep 2017 17:23:10 -0700 (PDT)
From: Lai Eddy <eddy.lai.tw@gmail.com>
Date: Wed, 20 Sep 2017 08:23:10 +0800
Message-ID: <CACrgode37rm7OnYgk1fLoJVHP1h0r3s_GUdwrpeOuKZnekfnaw@mail.gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: [meta-cloud-services] meta-cloud-services Dependencies
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
X-List-Received-Date: Wed, 20 Sep 2017 00:23:12 -0000
Content-Type: multipart/alternative; boundary="94eb2c0babca10ad73055993fb55"

--94eb2c0babca10ad73055993fb55
Content-Type: text/plain; charset="UTF-8"

according to layer README
http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/about/
it said

This layer depends on:

URI: git://github.com/openembedded/oe-core.git

but seems failed to clone from that URL
should that be
git://github.com/openembedded/meta-openembedded.git
or other repo available?

--94eb2c0babca10ad73055993fb55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">according to layer README<div><a href=3D"http://git.yoctop=
roject.org/cgit/cgit.cgi/meta-cloud-services/about/">http://git.yoctoprojec=
t.org/cgit/cgit.cgi/meta-cloud-services/about/</a><br></div><div>it said=C2=
=A0</div><div><pre style=3D"color:rgb(255,255,255);font-size:13.3333px;back=
ground-color:rgb(51,51,51)">This layer depends on:

URI: git://<a href=3D"http://github.com/openembedded/oe-core.git">github.co=
m/openembedded/oe-core.git</a></pre></div><div>but seems failed to clone fr=
om that URL</div><div>should that be=C2=A0</div><div>git://<a href=3D"http:=
//github.com/openembedded/meta-openembedded.git">github.com/openembedded/me=
ta-openembedded.git</a><br></div><div>or other repo available?</div><div><b=
r></div></div>

--94eb2c0babca10ad73055993fb55--
