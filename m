Return-Path: <bounce+256161.3a5685-meta-virtualization=yoctoproject.org@asterius.io>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9064CE00C64; Thu, 14 Apr 2016 18:06:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.130.122.4 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E527E00AD7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 18:06:39 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1460682398; h=Content-Type: To: From: Subject: Message-ID:
	Date: MIME-Version: Sender;
	bh=vbYTcIs039ZiyFskMCAtT34vzZfTawKPVz9pITuHdrg=;
	b=mzPb54JZnZBzlIcdEVLxzL+AuGjV85Ulu02/IA+zHPP7UQ0mosOa11vGdh1qi70BCzQV7U4b
	Ls1TM3gxlBJfK3c7AYywgXAdK1lVKcHAn1g2+HNrwi+0gv/vxEqwKogIU61HVNNa3yFqRbXk
	xNzPYoEpcYp4c3xn4jeSBKijXZE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: Date: Message-ID: Subject: From: To:
	Content-Type;
	b=jO9xS8lx4spsRG1fMOHsgbQeak1Qas10FK66XTnT0f2DJbx0Hm7N6+ZU/i/dGKJillmDBM
	MAaFVaF8Vr2OPna9LigpkhdAmpxPErLvjm02LCqz6zxWlwd6NGdRi7CYGdTdbc+cM8Rz6emY
	9qbnLE5wUpQuUxb3pq2A2SNuYX/s4=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIyMjRmYSIsICJtZXRhLXZpcnR1YWxpemF0aW9uQHlvY3RvcHJvamVjdC5vcmciLCAiM2E1Njg1Il0=
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mxa.mailgun.org with ESMTP id 57103e9e.7fc288773230-in01;
	Fri, 15 Apr 2016 01:06:38 -0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id f1so7991246igr.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 18:06:38 -0700 (PDT)
X-Gm-Message-State: AOPr4FW8oIlqNRl3sVOQnQSC48lysjpWM1YhFudzG0/YLCiGoNs2ubBw4YeAKBc82jd7Z5xgRgGnngf8K0zgLQ==
MIME-Version: 1.0
X-Received: by 10.50.232.47 with SMTP id tl15mr1619626igc.64.1460682397992;
	Thu, 14 Apr 2016 18:06:37 -0700 (PDT)
Received: by 10.107.169.37 with HTTP; Thu, 14 Apr 2016 18:06:37 -0700 (PDT)
Date: Thu, 14 Apr 2016 21:06:37 -0400
X-Gmail-Original-Message-ID: <CADNbA1rLRm702ks7401ina_Px1i1Bm2mi+Z0s1OJ3p+9FO_G=Q@mail.gmail.com>
Message-ID: <CADNbA1rLRm702ks7401ina_Px1i1Bm2mi+Z0s1OJ3p+9FO_G=Q@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Subject: - python packages
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
X-List-Received-Date: Fri, 15 Apr 2016 01:06:44 -0000
Content-Type: multipart/alternative; boundary=f46d04289bc976562e05307b9f11

--f46d04289bc976562e05307b9f11
Content-Type: text/plain; charset=UTF-8

I noticed are a few python recipes that exist in meta-openembedded
(python-six, python-requests, python-werkzeug, etc) and
meta-virtualization.  Is there any reason to keep these around or can I
remove them?  Also, is there any problem with me pulling the
non-virtualization specific recipes over there and eventually removing them
from meta-virtualization?

-Derek

--f46d04289bc976562e05307b9f11
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I noticed are a few python recipes that exist in meta-open=
embedded (python-six, python-requests, python-werkzeug, etc) and meta-virtu=
alization.=C2=A0 Is there any reason to keep these around or can I remove t=
hem?=C2=A0 Also, is there any problem with me pulling the non-virtualizatio=
n specific recipes over there and eventually removing them from meta-virtua=
lization?<div><br></div><div>-Derek</div></div>

--f46d04289bc976562e05307b9f11--
