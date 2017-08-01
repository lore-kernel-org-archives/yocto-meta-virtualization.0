Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7CF32E00BFB; Tue,  1 Aug 2017 05:27:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.0.94 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 10754 seconds by postgrey-1.32 at yocto-www;
	Tue, 01 Aug 2017 05:27:55 PDT
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0094.outbound.protection.outlook.com [104.47.0.94])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98269E00BFB
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Aug 2017 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Enea.onmicrosoft.com; 
	s=selector1-enea-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bhYmetH44H89oxljybjwzbczdSNbahI3qVUtG0j5TLE=;
	b=kWvIY1620JqlRSUM7b2dKgaiCLmw94Ekt44u9VkTQ9wJWIi0uoZ7Z8zSShfy/9uh/7cXXs6KFkDQ0+bHdGTk1urHZ0SJtuYyS2fMXzNtK2fnORKBD8/m0NfWsJi2gvshw9CO3qp1FaF1NNgewQHbPk2cQ0+SUEM7dx1pZJaQKR4=
Received: from VI1PR07MB0895.eurprd07.prod.outlook.com (10.161.108.25) by
	VI1PR07MB0846.eurprd07.prod.outlook.com (10.161.108.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.10; Tue, 1 Aug 2017 07:55:51 +0000
Received: from VI1PR07MB0895.eurprd07.prod.outlook.com
	([fe80::75d9:b559:511f:683c]) by
	VI1PR07MB0895.eurprd07.prod.outlook.com
	([fe80::75d9:b559:511f:683c%14]) with mapi id 15.01.1304.022;
	Tue, 1 Aug 2017 07:55:51 +0000
From: Adrian Dudau <Adrian.Dudau@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [meta-virtualization] [PATCH] python-requests: Drop recipe
Thread-Index: AQHS9ZLarvBrQfdm4UGRJGl2PDLqD6Jt5uyAgAD+sgCAAGZr8g==
Date: Tue, 1 Aug 2017 07:55:51 +0000
Message-ID: <yvpahpiy1vod6phfjme3xryy.1501574138645@email.android.com>
References: <1499261228-65117-1-git-send-email-adrian.dudau@enea.com>
	<1501497461.1765.0.camel@enea.com>,
	<CADkTA4OcN4rBKt1+qxsSY=P4Awsmsb6H3t8wPa0KQf=9O5o_jQ@mail.gmail.com>
In-Reply-To: <CADkTA4OcN4rBKt1+qxsSY=P4Awsmsb6H3t8wPa0KQf=9O5o_jQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [83.253.17.213]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR07MB0846;
	20:6jiBZE3NeQPQHP6pCiiOAEv7RdnydaVjwLqREQWZEuYSV1FNqMpWCxOTVNPBh4jm4YnAajsPirm4hbfD4wTgmhCXLspNIcyp28Zf5XwougfynOklraDdkt9MM5x52bhuwLbj/utvUu5XQLqaw7AT1P2r1EhUv4OxCysNkxaGA+Q=
x-ms-office365-filtering-correlation-id: b056e706-8e16-4640-435f-08d4d8b2bab6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:VI1PR07MB0846; 
x-ms-traffictypediagnostic: VI1PR07MB0846:
x-exchange-antispam-report-test: UriScan:(107004242121476)(251646265452963);
x-microsoft-antispam-prvs: <VI1PR07MB08461CA5E4EE00BA1FC22597E4B30@VI1PR07MB0846.eurprd07.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3002001)(920511095)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123560025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR07MB0846; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR07MB0846; 
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39400400002)(39410400002)(39830400002)(39450400003)(199003)(24454002)(377454003)(189002)(377424004)(81166006)(68736007)(33646002)(110136004)(606006)(7736002)(101416001)(38730400002)(53386004)(97736004)(3280700002)(6246003)(66066001)(4326008)(54356999)(50986999)(3660700001)(76176999)(53936002)(9686003)(6512007)(6306002)(51650200002)(6436002)(99286003)(189998001)(5660300001)(54896002)(1680700002)(106356001)(236005)(105586002)(9886003)(6486002)(81156014)(8936002)(25786009)(86362001)(575784001)(53546010)(63666004)(39060400002)(5250100002)(2906002)(2900100001)(966005)(14454004)(6506006)(3846002)(8676002)(2950100002)(6916009)(6116002)(229853002)(72206003)(95246002)(478600001)(102836003)(17260700007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB0846;
	H:VI1PR07MB0895.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: enea.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Adrian.Dudau@enea.com; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: enea.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2017 07:55:51.1242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8cdaed89-c47e-40b8-90b5-f28ad2c3fdca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB0846
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-requests: Drop recipe
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
X-List-Received-Date: Tue, 01 Aug 2017 12:27:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_yvpahpiy1vod6phfjme3xryy1501574138645emailandroidcom_"

--_000_yvpahpiy1vod6phfjme3xryy1501574138645emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry I ping the wrong mail, meant to do it for another patch.

--Adrian


Sent from my Samsung device


-------- Original message --------
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: 8/1/17 03:50 (GMT+01:00)
To: Adrian Dudau <Adrian.Dudau@enea.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-requests: Drop recipe

considering I replied "merged" to this already "ping" really isn't the righ=
t thing to
send.

What branch are you looking at ?

Bruce

commit 88277c84962e9d07ec777896a0ca8bd7db9ff5e2
Author: Adrian Dudau <adrian.dudau@enea.com<mailto:adrian.dudau@enea.com>>
Date:   Wed Jul 5 15:27:08 2017 +0200

    python-requests: Drop recipe

    There's a newer recipe (v2.13) maintained in meta-python. meta-openstac=
k
    explicitly prefers that version over this one, so no point in keeping
    this recipe since nobody else is using this version.

    Signed-off-by: Adrian Dudau <adrian.dudau@enea.com<mailto:adrian.dudau@=
enea.com>>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com<mailto:bruc=
e.ashfield@windriver.com>>

:100644 000000 187f97a... 0000000... D  recipes-devtools/python/python-requ=
ests_2.8.1.bb<http://python-requests_2.8.1.bb>

On Mon, Jul 31, 2017 at 6:37 AM, Adrian Dudau <Adrian.Dudau@enea.com<mailto=
:Adrian.Dudau@enea.com>> wrote:
On ons, 2017-07-05 at 15:27 +0200, Adrian Dudau wrote:
> There's a newer recipe (v2.13) maintained in meta-python. meta-
> openstack
> explicitly prefers that version over this one, so no point in keeping
> this recipe since nobody else is using this version.
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com<mailto:adrian.dudau@en=
ea.com>>
> ---
>  recipes-devtools/python/python-requests_2.8.1.bb<http://python-requests_=
2.8.1.bb> | 28 --------------
> ----------
>  1 file changed, 28 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-requests_2.8.1.bb<http=
://python-requests_2.8.1.bb>
>
> diff --git a/recipes-devtools/python/python-requests_2.8.1.bb<http://pyth=
on-requests_2.8.1.bb>
> b/recipes-devtools/python/python-requests_2.8.1.bb<http://python-requests=
_2.8.1.bb>
> deleted file mode 100644
> index 187f97a..0000000
> --- a/recipes-devtools/python/python-requests_2.8.1.bb<http://python-requ=
ests_2.8.1.bb>
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -HOMEPAGE =3D "http://python-requests.org"
> -SUMMARY =3D "Python HTTP for Humans."
> -DESCRIPTION =3D "\
> -  Requests is an Apache2 Licensed HTTP library, written in Python, \
> -  for human beings. \
> -  .      \
> -  Most existing Python modules for sending HTTP requests are
> extremely \
> -  verbose and cumbersome. Python's builtin urllib2 module provides
> most \
> -  of the HTTP capabilities you should need, but the api is
> thoroughly \
> -  broken.  It requires an enormous amount of work (even method
> overrides) \
> -  to perform the simplest of tasks. \
> -  .      \
> -  Things shouldn't be this way. Not in Python \
> -  "
> -SECTION =3D "devel/python"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D58c7e163c9f8ee037246da101c6afd1e"
> -
> -SRCNAME =3D "requests"
> -
> -SRC_URI =3D "http://pypi.python.org/packages/source/r/requests/${SRCNA
> ME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "a27ea3d72d7822906ddce5e252d6add9"
> -SRC_URI[sha256sum] =3D
> "84fe8d5bf4dcdcc49002446c47a146d17ac10facf00d9086659064ac43b6c25b"
> -
> -S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> --
> 2.7.4
>

ping!
--
_______________________________________________
meta-virtualization mailing list
meta-virtualization@yoctoproject.org<mailto:meta-virtualization@yoctoprojec=
t.org>
https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"

--_000_yvpahpiy1vod6phfjme3xryy1501574138645emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta content=3D"text/html; charset=3Dutf-8">
</head>
<body>
<div>Sorry I ping the wrong mail, meant to do it for another patch.</div>
<div><br>
</div>
<div>--Adrian</div>
<div><br>
</div>
<div><br>
</div>
<div id=3D"composer_signature">
<div dir=3D"auto" style=3D"font-size:88%; color:#364f67">Sent from my Samsu=
ng device</div>
</div>
<br>
<br>
-------- Original message --------<br>
From: Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt; <br>
Date: 8/1/17 03:50 (GMT&#43;01:00) <br>
To: Adrian Dudau &lt;Adrian.Dudau@enea.com&gt; <br>
Cc: meta-virtualization@yoctoproject.org <br>
Subject: Re: [meta-virtualization] [PATCH] python-requests: Drop recipe <br=
>
<br>
<div>
<div dir=3D"ltr">considering I replied &quot;merged&quot; to this already &=
quot;ping&quot; really isn't the right thing to
<div>send.</div>
<div><br>
</div>
<div>What branch are you looking at ?</div>
<div><br>
</div>
<div>Bruce</div>
<div><br>
</div>
<div>
<div class=3D"gmail_extra">
<div class=3D"gmail_extra">commit 88277c84962e9d07ec777896a0ca8bd7db9ff5e2<=
/div>
<div class=3D"gmail_extra">Author: Adrian Dudau &lt;<a href=3D"mailto:adria=
n.dudau@enea.com">adrian.dudau@enea.com</a>&gt;</div>
<div class=3D"gmail_extra">Date: &nbsp; Wed Jul 5 15:27:08 2017 &#43;0200</=
div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; python-requests: Drop recipe</div>
<div class=3D"gmail_extra">&nbsp; &nbsp;&nbsp;</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; There's a newer recipe (v2.13) mai=
ntained in meta-python. meta-openstack</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; explicitly prefers that version ov=
er this one, so no point in keeping</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; this recipe since nobody else is u=
sing this version.</div>
<div class=3D"gmail_extra">&nbsp; &nbsp;&nbsp;</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; Signed-off-by: Adrian Dudau &lt;<a=
 href=3D"mailto:adrian.dudau@enea.com">adrian.dudau@enea.com</a>&gt;</div>
<div class=3D"gmail_extra">&nbsp; &nbsp; Signed-off-by: Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.co=
m</a>&gt;</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">:100644 000000 187f97a... 0000000... D &nbsp;rec=
ipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb">python-req=
uests_2.8.1.bb</a></div>
<div><br>
</div>
<div class=3D"gmail_quote">On Mon, Jul 31, 2017 at 6:37 AM, Adrian Dudau <s=
pan dir=3D"ltr">
&lt;<a href=3D"mailto:Adrian.Dudau@enea.com" target=3D"_blank">Adrian.Dudau=
@enea.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; border=
-left:1px solid rgb(204,204,204); padding-left:1ex">
<div class=3D"gmail-HOEnZb">
<div class=3D"gmail-h5">On ons, 2017-07-05 at 15:27 &#43;0200, Adrian Dudau=
 wrote:<br>
&gt; There's a newer recipe (v2.13) maintained in meta-python. meta-<br>
&gt; openstack<br>
&gt; explicitly prefers that version over this one, so no point in keeping<=
br>
&gt; this recipe since nobody else is using this version.<br>
&gt;<br>
&gt; Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.co=
m">adrian.dudau@enea.com</a>&gt;<br>
&gt; ---<br>
&gt; &nbsp;recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pytho<wbr>n-requests_2.8.1.bb</a> =
| 28 --------------<br>
&gt; ----------<br>
&gt; &nbsp;1 file changed, 28 deletions(-)<br>
&gt; &nbsp;delete mode 100644 recipes-devtools/python/<a href=3D"http://pyt=
hon-requests_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-req=
uests_2.8.1.bb</a><br>
&gt;<br>
&gt; diff --git a/recipes-devtools/python/<a href=3D"http://python-requests=
_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.=
bb</a><br>
&gt; b/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 187f97a..0000000<br>
&gt; --- a/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><=
br>
&gt; &#43;&#43;&#43; /dev/null<br>
&gt; @@ -1,28 &#43;0,0 @@<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://python-requests.org" rel=3D"nore=
ferrer" target=3D"_blank">http://python-requests.org</a>&quot;<br>
&gt; -SUMMARY =3D &quot;Python HTTP for Humans.&quot;<br>
&gt; -DESCRIPTION =3D &quot;\<br>
&gt; -&nbsp;&nbsp;Requests is an Apache2 Licensed HTTP library, written in =
Python, \<br>
&gt; -&nbsp;&nbsp;for human beings. \<br>
&gt; -&nbsp;&nbsp;.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br>
&gt; -&nbsp;&nbsp;Most existing Python modules for sending HTTP requests ar=
e<br>
&gt; extremely \<br>
&gt; -&nbsp;&nbsp;verbose and cumbersome. Python's builtin urllib2 module p=
rovides<br>
&gt; most \<br>
&gt; -&nbsp;&nbsp;of the HTTP capabilities you should need, but the api is<=
br>
&gt; thoroughly \<br>
&gt; -&nbsp;&nbsp;broken.&nbsp;&nbsp;It requires an enormous amount of work=
 (even method<br>
&gt; overrides) \<br>
&gt; -&nbsp;&nbsp;to perform the simplest of tasks. \<br>
&gt; -&nbsp;&nbsp;.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br>
&gt; -&nbsp;&nbsp;Things shouldn't be this way. Not in Python \<br>
&gt; -&nbsp;&nbsp;&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3D<wbr>58c7e163c9f8ee037246da101c6afd<wbr>1e&=
quot;<br>
&gt; -<br>
&gt; -SRCNAME =3D &quot;requests&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/r=
/requests/${SRCNA" rel=3D"noreferrer" target=3D"_blank">http://pypi.python.=
org/<wbr>packages/source/r/requests/${<wbr>SRCNA</a><br>
&gt; ME}-${PV}.tar.gz&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>a27ea3d72d7822906ddce5e252d6ad<wbr>d9&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;<wbr>84fe8d5bf4dcdcc49002446c47a146<wbr>d17ac10facf00d9086659064=
ac43b6<wbr>c25b&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
&gt; -<br>
&gt; -inherit setuptools<br>
&gt; --&nbsp;<br>
&gt; 2.7.4<br>
&gt;<br>
<br>
</div>
</div>
ping!<br>
<div class=3D"gmail-HOEnZb">
<div class=3D"gmail-h5">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div>
</div>
</blockquote>
</div>
<br>
<br clear=3D"all">
<div><br>
</div>
-- <br>
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_yvpahpiy1vod6phfjme3xryy1501574138645emailandroidcom_--
