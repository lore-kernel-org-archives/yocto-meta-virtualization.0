Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DFCDE00D57; Tue, 26 Apr 2016 14:31:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4135E00D54
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Apr 2016 14:31:39 -0700 (PDT)
Received: by mail-oi0-f50.google.com with SMTP id x201so29537976oif.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Apr 2016 14:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=jFZUOl+fWBYq7rXx89ZKiYPmA5wEiXXCefgKa2fjtqk=;
	b=qpiZ2Hc/d8k83ZOjoYl16LJyD5DC2+rA6Yu80TPIvLDzsMydwJFQyVfpdjCPpJHX63
	0+bKoGg5ryUm/YpmCR5P+jookAhObu2VkPTjq6Q8alPNwKkmZqtTkitMiY0gwovjG4aD
	trDbE9JNPhwRm+xBwC2CMJn0ErpQ/lyPcaIpyHJn9WNpeFm+ZTGsWJUi9/4ZxKJFvdZt
	86Sj1VU1AgifntVSdBZlcd52ENC0rBDIlsqlzRt1H7SrOS2KeE7/NKa5N/rzXsoidLf5
	pc7ihywp2M+vZ3LhGMSyrokwaX/TLbMNHLN5Exbj5vPkIFm/kTmyxPgBxqjHvfBJ2J2q
	FtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=jFZUOl+fWBYq7rXx89ZKiYPmA5wEiXXCefgKa2fjtqk=;
	b=SCfuN+zggzU6Ucew4hEeJ+DQN/Xzb1HeKXqTPQoUhu1dGK8gkSmyvuGHommVZt7A2i
	2HYKjhSXbMb5Nxcqpi63smMcNmawjEgDaweWnqfhFgP1Y2TL4wRwNn1ekWt9fpbipe+R
	8xsODTPaSSBCSOY++muSj8IH+iBsKAkmLrp6cqxKFU1tNqtt6gaAOWFUw3PqRpLVY/Vz
	4fawbiGf1BNA8ZS9D4/bnglx+U3BiuNKIF93T6GOeMhn7dVBWIa9Jcormban9jTlGW5i
	zUWg0r+gmeJKC7bpAn7LS3QaJEGcQppbwjrGjIsU2i7v/gkaNXr0DKSQ4k3UcuR0FFKS
	wUaA==
X-Gm-Message-State: AOPr4FWou1pLh7HULCekt7h50wWnMKIvI/FtvtKjEdm9dztSEMZwGQf0DJSRO1/LPGu4ip0vWdXeKAOkgJO34w==
MIME-Version: 1.0
X-Received: by 10.202.46.139 with SMTP id u133mr1995150oiu.16.1461706298465;
	Tue, 26 Apr 2016 14:31:38 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 26 Apr 2016 14:31:38 -0700 (PDT)
Date: Tue, 26 Apr 2016 17:31:38 -0400
Message-ID: <CADkTA4Ncg3egtez_wdu3MDCJrXO3+=0cbdUE0u=0BqQKi9khCQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: FYI: meta-virtualization branched
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
X-List-Received-Date: Tue, 26 Apr 2016 21:31:40 -0000
Content-Type: multipart/alternative; boundary=001a1137c99cafae1705316a0410

--001a1137c99cafae1705316a0410
Content-Type: text/plain; charset=UTF-8

Just a heads up that I branched meta-virtualization to match the yocto 2.1
release (which happens soon). Use the krogoth branch if you want to follow
that content.

lxc 2.0.0 just made it under the wire for the release branching.

On a related note, now that I've branched I'm about to push an updated
docker (1.11.0) and go-cross to meta-virtualization. Along with that I've
cleaned up the docker components that are no longer required and introduced
new components that are based on the open container initiative.

Cheers,

Bruce

-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1137c99cafae1705316a0410
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just a heads up that I branched meta-virtualization to mat=
ch the yocto 2.1<div>release (which happens soon). Use the krogoth branch i=
f you want to follow</div><div>that content.</div><div><br></div><div>lxc 2=
.0.0 just made it under the wire for the release branching.</div><div><br><=
/div><div>On a related note, now that I&#39;ve branched I&#39;m about to pu=
sh an updated</div><div>docker (1.11.0) and go-cross to meta-virtualization=
. Along with that I&#39;ve</div><div>cleaned up the docker components that =
are no longer required and introduced</div><div>new components that are bas=
ed on the open container initiative.=C2=A0</div><div><br></div><div>Cheers,=
</div><div><br></div><div>Bruce</div><div><br></div><div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a1137c99cafae1705316a0410--
