Return-Path: <nitishjha16@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B4A0E008D0; Wed,  1 Mar 2017 02:49:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.178 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (nitishjha16[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.178 listed in dnsbl.sorbs.net]
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E70BAE00726
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Mar 2017 02:49:03 -0800 (PST)
Received: by mail-io0-f178.google.com with SMTP id l7so28214285ioe.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 Mar 2017 02:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=cHPeQW8STGcoTmiA5p8ocL7+4LFP3QwbWxudCHWkrXg=;
	b=aKq1XUGVXByjiumuQ0MKWMKlS66JRHhX/j9s1fCWEmBrApRUcICJjzM4iselplCwIV
	Uu/28ygMwDk1rwn0gruqb+p4QMBMuwOqBJK+UmVgas2GLh+c554y9hYWdLdZUwc8lF+e
	+RnABvMPJY8Ou4s9Vp5pwBSWFG/a46Cdo7uZlYrU8o1QED5u+mOSpMR/YsonHz1GWqda
	FtoGXHwF4MKIkdIWrVqRRvXOE3Ybenp0WeK7Yx8BOjm1ZiqRk78XReZc6i5dNTDnK26s
	+esAemVEGlXmHlU5PdDKEpukf3CpcSh7/7p2b2GoSNEelaAXP+M4Oz5vCp4Jj593iCl7
	fQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=cHPeQW8STGcoTmiA5p8ocL7+4LFP3QwbWxudCHWkrXg=;
	b=ehOfKiXCSdlO+HAvcPYflRyT6vISlsjW2XG12CeECQZloL4UvrGCtjxVvxx0phxyhq
	6u5jDngiucJ6HzdfLWVOEtsxbyoGydh4EUh08zFn6xDRD3GYGRz/wdKJ3sTL/etpMfcc
	srs0qyaEf/JkAbqMEc/nhqL5rn4dafi4840uLZ7e7O0FeC5ijlpSgtJmphfqiwOqDpND
	6vMmoCvc7Q5Y8OxV/iNdyTXUx9hy2W23EMBAYbcnqADSuwL8nRbjUwySbH9UGCKCpiXN
	i4oIMWJ+LQgIxxWP/AuyIgBms4A9HbieJCECkQyfqbMU9e1PaDrL/Bfxnjxb0fDVy3Cz
	+u0Q==
X-Gm-Message-State: AMke39nj3QCHBzmNjfSEOZG7l6JmwMm1BziULPY0fK8koEzBtu0n8l1mKjH1d0w2HDUzU2Cgt8RapLiCFbxiZA==
X-Received: by 10.107.20.86 with SMTP id 83mr3507323iou.94.1488365343076; Wed,
	01 Mar 2017 02:49:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.139.138 with HTTP; Wed, 1 Mar 2017 02:49:02 -0800 (PST)
From: nitish jha <nitishjha16@gmail.com>
Date: Wed, 1 Mar 2017 11:49:02 +0100
Message-ID: <CABh+foZe-UwGBX9T3Dcp9XBJMnHmxEh5qnbruTSfR7yDrZP81Q@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Xen-image-minimal: xl tool error
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
X-List-Received-Date: Wed, 01 Mar 2017 10:49:07 -0000
Content-Type: multipart/alternative; boundary=001a114fceda91f8880549a90f23

--001a114fceda91f8880549a90f23
Content-Type: text/plain; charset=UTF-8

Hi All,

I somehow build xen-image-minimal successfully.

Machine type used is qemux86-64

But inside qemu when I try to run *xl list *command, it gives error :  Could
not obtain handle on privileged command interface

I am already logged in with root.

What I am not understanding is once we build xen-image-minimal, is xl tool
not included in that?

if yes then what else I am missing to make it work

Is there any wiki page which gives details on how to use xen with yocto

Thanks and Regards
-- 
Nitish Jha

--001a114fceda91f8880549a90f23
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I somehow build xen-image-minim=
al successfully.</div><div><br></div><div>Machine type used is qemux86-64</=
div><div><br></div><div>But inside qemu when I try to run <b>xl list </b>co=
mmand, it gives error : =C2=A0<span style=3D"color:rgb(84,84,84)">Could not=
 obtain handle on privileged=C2=A0</span><span style=3D"font-weight:bold;co=
lor:rgb(106,106,106)">command</span><span style=3D"color:rgb(84,84,84)">=C2=
=A0interface</span></div><div><font color=3D"#545454"><br></font></div><div=
><font color=3D"#545454">I am already logged in with root.</font></div><div=
><font color=3D"#545454"><br></font></div><div><font color=3D"#545454">What=
 I am not understanding is once we build xen-image-minimal, is xl tool not =
included in that?</font></div><div><font color=3D"#545454"><br></font></div=
><div><font color=3D"#545454">if yes then what else I am missing to make it=
 work</font></div><div><font color=3D"#545454"><br></font></div><div><font =
color=3D"#545454">Is there any wiki page which gives details on how to use =
xen with yocto</font></div><div><font color=3D"#545454"><br></font></div><d=
iv><font color=3D"#545454">Thanks and Regards<br></font>-- <br>Nitish Jha<b=
r><br><br></div></div>

--001a114fceda91f8880549a90f23--
