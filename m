Return-Path: <jeff.dagenais@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95CA4E00DC2; Tue,  5 Jul 2016 04:55:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jeff.dagenais[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1E0EE00DBD
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jul 2016 04:55:05 -0700 (PDT)
Received: by mail-it0-f65.google.com with SMTP id y93so11260724ita.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Jul 2016 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=AdjxtCKX+rDHlLQOwXD2kBskPyHdDeXhSh+/uDAL4lc=;
	b=J4kvu2bMXliUsEOgvBgwR6b0uetbzMRceooEV4YiGXdAoNf+PjZDE9T21CsjY2G95g
	7Uy2pSWB8MCzrRdQXVyBOqqYvZC6oS+6R0aZ9GwzgJdGTvmAjOhk8utnc6zYDVXnDrnP
	NOZwnWaMQF4snlg0bnzyKm4n1DPpjTULXU7XXpl6d+Z6cj3sohuRnyNF/Oi16ZurxQdQ
	LIUjAfXKpAFUOBM1UhoZY9BuzNGQ20NNZJ2mCRduVnc5zxd8otkIMuSIx+OgUqJ/EArn
	dP97ynGifa7nmeGqQKtAlN+4yUNHiUCLwHut/N0QffDTvYnzvITtOmuG5T2VbGkCNIWa
	OfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AdjxtCKX+rDHlLQOwXD2kBskPyHdDeXhSh+/uDAL4lc=;
	b=DMkoVUYiZA0iVLfp6xOBoZwOtoSzH4USOGL4DAeYGAV+mQNsCIBosHkq7NrG+Agffd
	ACt3UNEcSw1x2sOfT1VV/pt0Jafo0NRFj+S5Lf8pUjTNJ9gTouDaWEeeCwbwouvOAAuh
	GTiqXPNrKCEO5iHB4+ThXZuqdLner+DiqmSfnGC3CvVVNopY3mMOFoz2XyqoxAdBOUJl
	obxqLPnQD7/w0/L5/wgwomLVN5T4gRHaNXXG488w6z8gCw19xedywYef3OJKn51apndK
	Ri5oIFbBMbp9IRt3P/l1HTCueXuF1tyUUmDAVQQJz5wVh7brEQ8EAa9WukBje4bx3Oe0
	tEMQ==
X-Gm-Message-State: ALyK8tL7YUUWEH3GYlNtcXr49tV3mmhFud+eeoV1MCPHjGlcwLfeuZ/ZgqaUNcVWfJWU4Q==
X-Received: by 10.36.112.199 with SMTP id f190mr13127081itc.59.1467719705122; 
	Tue, 05 Jul 2016 04:55:05 -0700 (PDT)
Received: from [172.20.10.2] ([24.114.84.53]) by smtp.gmail.com with ESMTPSA id
	z205sm1231581itc.11.2016.07.05.04.55.03
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jul 2016 04:55:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <CADkTA4PBi1cT2QqVeWr39vB2Zvu2i=A4tD7QF=fBGC4LvPW93A@mail.gmail.com>
Date: Tue, 5 Jul 2016 07:55:03 -0400
Message-Id: <62DD010A-DDDB-42AE-B1EF-1A8EBE7C73A8@gmail.com>
References: <E2C6389C-370A-4B0F-81EA-95D6F9F51BFE@gmail.com>
	<CADkTA4PBi1cT2QqVeWr39vB2Zvu2i=A4tD7QF=fBGC4LvPW93A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: docker: error creating default bridge network: package not installed
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
X-List-Received-Date: Tue, 05 Jul 2016 11:55:06 -0000
X-Groupsio-MsgNum: 2000
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CC7C4BFF-904E-4FA1-89C1-20CE619DEB46";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_CC7C4BFF-904E-4FA1-89C1-20CE619DEB46
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_410702AA-1B8D-4551-94F8-4AACC1C42842"

--Apple-Mail=_410702AA-1B8D-4551-94F8-4AACC1C42842
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Bruce,

> On Jul 4, 2016, at 00:30, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>=20
> I run the docker check scripts across linux-yocto* periodically, and =
my reports are
> clean. So there's could be something up with the mixing of the new =
docker and
> the older fido bbappend, or simply that 3.19 didn't get much love.

Perhaps. But I was a part of my own failure. We use a local cloned =
linux-yocto
tree (complete with meta) in which we have our own machine branches and =
meta
branch. To override the repo url I had completely replaced ( =3D ) the =
SRC_URI
variable in my linux-yocto_3.19.bbappend. This had the effect of =
removing the
.scc's meta-virtualization was adding to the SRC_URI.

What's the best way to remove items from a bitbake var? I only briefly =
looked for
that... Is it through a python code fragment expansion? Or is there a =
more
"bitbake-centric" way to do it?

Anyway, thanks for the help!
/jfd

--Apple-Mail=_410702AA-1B8D-4551-94F8-4AACC1C42842
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi Bruce,<div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Jul 4, 2016, at 00:30, Bruce =
Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
class=3D"">bruce.ashfield@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D"">I run the docker check =
scripts across linux-yocto* periodically, and my reports are</div><div =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D"">clean. So there's could be =
something up with the mixing of the new docker and</div><div =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D"">the older fido bbappend, or =
simply that 3.19 didn't get much love.</div></div></blockquote><br =
class=3D""></div><div><div>Perhaps. But I was a part of my own failure. =
We use a local cloned linux-yocto</div><div>tree (complete with meta) in =
which we have our own machine branches and meta</div><div>branch. To =
override the repo url I had completely replaced ( =3D ) the =
SRC_URI</div><div>variable in my linux-yocto_3.19.bbappend. This had the =
effect of removing the</div><div>.scc's meta-virtualization was adding =
to the SRC_URI.</div><div><br class=3D""></div><div>What's the best way =
to remove items from a bitbake var? I only briefly looked =
for</div><div>that... Is it through a python code fragment expansion? Or =
is there a more</div><div>"bitbake-centric" way to do it?</div><div><br =
class=3D""></div><div>Anyway, thanks for the =
help!</div><div>/jfd</div></div></div></body></html>=

--Apple-Mail=_410702AA-1B8D-4551-94F8-4AACC1C42842--

--Apple-Mail=_CC7C4BFF-904E-4FA1-89C1-20CE619DEB46
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iF4EAREKAAYFAld7oBgACgkQjTW55WAAo48KHQEAiGUs6vQ4SxxKBqT3HJJv+ur0
BT+WZs5fyS/e8m957N0A/iBEPK1NmefwgF7/jcD9nOKVGzdfG7/XTmwnom+Ru2k7
=LzWA
-----END PGP SIGNATURE-----

--Apple-Mail=_CC7C4BFF-904E-4FA1-89C1-20CE619DEB46--
