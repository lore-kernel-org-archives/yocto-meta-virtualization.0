Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9175E00BA2; Sun, 18 Jun 2017 23:58:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.176 listed in list.dnswl.org]
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23950E00AF0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Jun 2017 23:58:39 -0700 (PDT)
Received: by mail-ot0-f176.google.com with SMTP id u13so47446542otd.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Jun 2017 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=tOpmnUUaFQQPitJ6selN56XLxGodk/F6i+R/Yb3Nl9Q=;
	b=WqXjYDZU1iltkZqb6/sHlogx+AIRc6aGqwvgItg1zDE1ELgxgrjmSLIA01Kl4BwpPG
	KmD/6Zgocyppg7p55l730xRZJjRwFRMuejbA54OHs9xGly5hLfvNgN7St4dV+YjK2rnC
	WbfMKe3z6pOTfQ+AqyYW5Y/Kb6uos3JW9q9D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tOpmnUUaFQQPitJ6selN56XLxGodk/F6i+R/Yb3Nl9Q=;
	b=M2y/4g3nntgL/mCpjOrpyEvXSn8rrZM+si3yND/w23Il5h6AAyZsAIST/g/HEB6VzG
	84lur26XznBbgGAnXcSv8kLyoCA9qhxFJxboX2jHo7EECct60dmmbM9PMLE2Q7+Fmu5p
	ZUQzpIYGGzcZgXNpfL8XBJxAXYDoQjPR0o5Ki/9j3hGNobRbnvLQoNnR0rmIM6IEn41Z
	wPw6oEGrwp7d+7ZfkfFsnZQf/0WnAXYZjLrqoTRumkyy4qSa+VV5YwFL0L+jZlpwucpM
	3U245KjGdLIsSPbB+qoWW9BFhS4XR/vXDdLyJHZiWacg6dSqnLBSvwKboPc1rX3r3Kxm
	efew==
X-Gm-Message-State: AKS2vOx2pGW/8hdm+Q+cHBBERPgh19cCDV1AOIVwWf24f20j3KVh15aW
	x8PcvJhyvonpmH4K8Y3XRVhUJUP9a4qL
X-Received: by 10.157.80.131 with SMTP id b3mr11938681oth.4.1497855518857;
	Sun, 18 Jun 2017 23:58:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.13.80 with HTTP; Sun, 18 Jun 2017 23:58:38 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Mon, 19 Jun 2017 08:58:38 +0200
Message-ID: <CAFL6qn66cKkfowybMqSBrROogMxRw1R1eQk65E4y=HM0wyfmrA@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-virtualization@yoctoproject.org
Subject: How to asign especific HW to each OS working with Xen over MPSoC
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
X-List-Received-Date: Mon, 19 Jun 2017 06:58:40 -0000
Content-Type: multipart/alternative; boundary="f4030435aeb42077f405524aaa0a"

--f4030435aeb42077f405524aaa0a
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm very interested in knowing how to asign especific HW to each one of the
running OS-s if I'm working with Xen hypervisor. Is it possible? Where do I
need to specify this?

On the other hand, I also would like to know, how would the different OS-s
running under Xen hypervisor communicate between them. I.e.: an application
running over Linux (i.e.: Docker) and FreeRTOS.

Finally, it would be interesting for me too, to know how to debug the
behaviour of an OS running under Xen (i.e.: FreeRTOS) in the real MPSoC
board.

Any answer would be helpful,

Thanks,
Pello

--f4030435aeb42077f405524aaa0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi all,<br><br></div>I&#39;m very inte=
rested in knowing how to asign especific HW to each one of the running OS-s=
 if I&#39;m working with Xen hypervisor. Is it possible? Where do I need to=
 specify this?<br><br></div><div>On the other hand, I also would like to kn=
ow, how would the different OS-s running under Xen hypervisor communicate b=
etween them. I.e.: an application running over Linux (i.e.: Docker) and Fre=
eRTOS.<br><br></div><div>Finally, it would be interesting for me too, to kn=
ow how to debug the behaviour of an OS running under Xen (i.e.: FreeRTOS) i=
n the real MPSoC board.<br></div><div><br></div>Any answer would be helpful=
,<br><br></div>Thanks,<br></div>Pello<br></div>

--f4030435aeb42077f405524aaa0a--
