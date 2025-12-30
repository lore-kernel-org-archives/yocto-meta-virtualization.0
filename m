Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4295E9410E
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 04:11:07 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58521.1767067866091956769
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Dec 2025 20:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3ehEQB0;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c718c5481so9281158a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Dec 2025 20:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767067865; x=1767672665; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JsM2IJ3p5DqTLZIxdFhY0mwZZHDAlJ2ViwI5t/BwwSI=;
        b=K3ehEQB04+iU9mKq6k/BYCQp2010Xz9we5uLDHBFzqifKKXXjqfsXvrFJ4KgHsh6ql
         xj6NhIVdRS/Nk7cEBWl1XX4pNY2nsBoX89lPvi//tbdUBv3HepjKW1hZjh7DWUVvqmxp
         GuNA3WVSC6fccWI5Mg18BmgDfG6rI3TrSYZ52yi3S9RYu9Q23Iq8lNDTgbIEr6DsHOC8
         sZv9oEPTmSNralGtHhlKNgPPS+Ek/ewQYTLh6og7R1F/vak9VLgjgOXwI4AdaKu5ueC9
         RMIrHuzBNBsgf7i8tGBoSD7MdKaX/0k/HgTp5A6b1WdH7POPaaloixxndjKpON8dkMQz
         pvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767067865; x=1767672665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsM2IJ3p5DqTLZIxdFhY0mwZZHDAlJ2ViwI5t/BwwSI=;
        b=GWNoXhiCHkkNLBAy9f0tnM3Uuh9QoLRvsFcBaKUwbtLUaumOYQswJk+NDj/E8G1LjV
         Of+gm+GpoWsQbsipsroHqLIILf0TwqTTHtdsGG3NT0KYj0742z8DjwkV/oq21TkuByY9
         6YqPRVeHRS8yRMvZXOmociXQQZJAzcwO4g2EUyi+8JZXdMeQwMBujXP4uc8yXPfSxvy2
         LT3bvevp2Ht3SbEEVwS/IQLTAfzvjP4Vs03qEw6WYdWVl5aOdemtYJDzicPsUpXjT8Os
         sjx2XYWUgw7U2Rau45M6nrvEcd1h0gG5L0MlHZ+bJ7udTclkB2AnmGZp4KlXbmytLmZc
         KbKw==
X-Gm-Message-State: AOJu0YyDyU2okSzcQv9MrFVd46xCV/+G7RrtnjQXOM8Xl4EtugGtvy1+
	r/m2nt88jcajwZUa/8H52WPQoNtBO/qsaA/s1yf1xzSkD2/0Rz+0zBN6Ibha+1RsExPkdTfZc3a
	QbuMdCoGWa+U19mK5Il22751ThhRybdk=
X-Gm-Gg: AY/fxX5qpDI7Eav8zDmF272MTdOaw4CrikIB0+GwZucjt7GFGm+w4jNpibH5PBo0Fp+
	X+Vl2WiBjlJzfHfBp3tM8levLCCTDftuHUeipn7gQXieRJScyGPn6MRvLFY3Hg2LEdINef1kOPu
	FaomqnwethCPq1DufJAcIh9OJR6ilLROUcUD8QxQLcQifa0CfNJoRkvAECojRArQm5CcvNjNe17
	FhGLwocubzOQiY0jkPKWfWX9hylkDEbJPDqQUSB4lQPYy0qRvUxlXZLlttCNq7un3woRw==
X-Google-Smtp-Source: AGHT+IG7N9ZClliJ57gK1TmnFiODlNrg32ilsQ9MJAdhbbJb4odc8WlHaJwDi22uCXSAkyD4wRBj8MPyBbVnnR0CPMg=
X-Received: by 2002:a17:90a:dfc6:b0:343:66e2:5fa8 with SMTP id
 98e67ed59e1d1-34e921c3e54mr27779076a91.21.1767067865111; Mon, 29 Dec 2025
 20:11:05 -0800 (PST)
MIME-Version: 1.0
References: <CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCA@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCA@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Dec 2025 00:10:53 -0400
X-Gm-Features: AQt7F2qujuuiuv-M5O4hJ4AJB2mEv6nNjrG_QiDaF2eWK9h9swDQFfDeiOJ8poA
Message-ID: <CADkTA4Nr+DKoNVQhT4zb_BoOb9vH09WpLj0OCnLhiFyRg9twGw@mail.gmail.com>
Subject: Re: Issues with the new go-mod-vcs
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000064e0ae0647238c25"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Dec 2025 04:11:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9511

--00000000000064e0ae0647238c25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 11:23=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.com> w=
rote:

> Hi Bruce,
>
>
>
> The new go-mod-vcs recently introduced in meta-virt  has some some
> problems.
>
>
>
> The first and most significant one is the misuse of
> BB_GIT_SHALLOW_EXTRA_REFS. It causes fetching failure when shallow tarbal=
l
> generation is enabled.
>

I wouldn't call it a misuse, it is actually required to make the support
work
and attempt to save some download space. There are thousands of dependencie=
s
for some of the recipes and MANY of them have tags that aren't on branches,
or
aren't at the tip of branches, so those refs are there to force a deep
enough fetch
or to ensure that bitbake does the same "deshallowing"  as was done during
generation.

I could probably switch it out for tag=3D in the different entries. I've ma=
de
that
tweak and will run some tests.



> Use the following steps to reproduce the error:
>
>    1. Add in local.conf:
>
> BB_GENERATE_SHALLOW_TARBALLS =3D "1"
>
> BB_GIT_SHALLOW =3D "1"
>
>    2. bitbake cni -c fetch
>
>
>
> Error message: fatal: couldn't find remote ref v0.0.4
>
> Root cause: the repos specified in SRC_URI does not contain the required
> extra refs specified by BB_GIT_SHALLOW_EXTRA_REFS.
>
I run with that all the time, I've never seen it, those
BB_GIT_SHALLOW_EXTRA_REFS
are
not magic, they come directly from the repositories during discovery and
are required to deshallow
a repository.

My tests with the tag parameter may solve the issue. So stay tuned, I have
that and several other
changes pending. But none of them will be until the end of next week once I
am back in the office.


>
>
> The second one is the duplicate entries in SRC_URI. Example: errdefs in
> docker-compose.
>
>
>

It builds fine here, what issues are you seeing with it ? Are you using VCS
mode ? or hybrid ?

You can be assured that anything I pushed has been built many times, and ha=
s
been runtime tested. So the first information you need to provide is more
details
about what you are building, so I can track down the differences.


> The third one is the =E2=80=98shallow=3D1=E2=80=99 parameter in SRC_URI. =
The problem is that
> git fetcher does not support such parameter.
>
> In fetch2/git.py: ud.shallow =3D d.getVar("BB_GIT_SHALLOW") =3D=3D "1"
>
> So I guess these could be removed? And switching to use
> BB_GIT_SHALLOW:pn-xxx =3D =E2=80=9C1=E2=80=9D?
>

No. I plan to add more support for that later, it just isn't ready yet.
They will stay.


>
> P.S.
>
> I sent a related patch to bitbake:
> https://lists.openembedded.org/g/bitbake-devel/message/18656
>
> The problem in bitbake is revealed by the current SRC_URI settings in
> meta-virt.
>
> If you get similar error, you can apply the above patch.
>

If I was going to see that error, I would have already ...

Bruce



>
>
> Regards,
>
> Qi
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000064e0ae0647238c25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 29, 2025 at 11:23=
=E2=80=AFPM Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@w=
indriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div class=3D"msg7311529041201683385">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_7311529041201683385WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Hi Bruce,<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The new go-mod-vcs re=
cently introduced in meta-virt =C2=A0has some some problems.<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The first and most si=
gnificant one is the misuse of BB_GIT_SHALLOW_EXTRA_REFS. It causes fetchin=
g failure when shallow tarball generation is enabled.</span></p></div></div=
></div></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">I wouldn&#39;t call it a misuse, it is actually=C2=A0r=
equired=C2=A0to make the support work</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">and attempt to save some download space. There are t=
housands of dependencies</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">for some of the recipes and MANY of them have tags that aren&#39;=
t on branches, or</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">aren&#39;t at the tip of branches, so those refs are there to force a de=
ep enough fetch</div><div class=3D"gmail_default" style=3D"font-size:small"=
>or to ensure that bitbake does the same &quot;deshallowing&quot;=C2=A0 as =
was done during</div><div class=3D"gmail_default" style=3D"font-size:small"=
>generation.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">I could prob=
ably switch it out for tag=3D in the different entries. I&#39;ve made that<=
/div><div class=3D"gmail_default" style=3D"font-size:small">tweak and will =
run some tests.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div class=3D"msg7311529041201683385"><div lang=3D"E=
N-US" style=3D"overflow-wrap: break-word;"><div class=3D"m_7311529041201683=
385WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Use the following ste=
ps to reproduce the error:<u></u><u></u></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"m_7311529041201683385MsoListParagraph" style=3D"margin-left:0i=
n"><span style=3D"font-size:11pt">Add in local.conf:<u></u><u></u></span></=
li></ol>
<p class=3D"m_7311529041201683385MsoListParagraph"><span style=3D"font-size=
:11pt">BB_GENERATE_SHALLOW_TARBALLS =3D &quot;1&quot;<u></u><u></u></span><=
/p>
<p class=3D"m_7311529041201683385MsoListParagraph"><span style=3D"font-size=
:11pt">BB_GIT_SHALLOW =3D &quot;1&quot;<u></u><u></u></span></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"m_7311529041201683385MsoListParagraph" style=3D"margin-left:0i=
n"><span style=3D"font-size:11pt">bitbake cni -c fetch<u></u><u></u></span>=
</li></ol>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Error message: fatal:=
 couldn&#39;t find remote ref v0.0.4<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Root cause: the repos=
 specified in SRC_URI does not contain the required extra refs specified by=
=C2=A0</span><span style=3D"font-size:14.6667px">BB_GIT_SHALLOW_EXTRA_REFS<=
/span><span style=3D"font-size:11pt">.</span></p></div></div></div></blockq=
uote><div><div class=3D"gmail_default" style=3D"font-size:small"></div><div=
 class=3D"gmail_default" style=3D"font-size:small">I run with that all the =
time, I&#39;ve never seen it, those=C2=A0<span style=3D"font-size:14.6667px=
">BB_GIT_SHALLOW_EXTRA_REFS are</span></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">not magic, they come directly from the repositories=
 during discovery and are required to deshallow</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">a repository.</div></div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">My tests with the tag parameter may solve the i=
ssue. So stay tuned, I have that and several other</div><div class=3D"gmail=
_default" style=3D"font-size:small">changes pending. But none of them will =
be until the end of next week once I am back in the office.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g7311529041201683385"><div lang=3D"EN-US" style=3D"overflow-wrap: break-wor=
d;"><div class=3D"m_7311529041201683385WordSection1"><p class=3D"MsoNormal"=
><span style=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The second one is the=
 duplicate entries in SRC_URI. Example: errdefs in docker-compose.<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0</span><=
/p></div></div></div></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">It builds fine here, what issues are you =
seeing with it ? Are you using VCS</div></div><div class=3D"gmail_default" =
style=3D"font-size:small">mode ? or hybrid ?</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">You can be assured that anything I pushed has been bui=
lt many times, and has</div><div class=3D"gmail_default" style=3D"font-size=
:small">been runtime tested. So the first information you need to provide i=
s more details</div><div class=3D"gmail_default" style=3D"font-size:small">=
about what you are building, so I can track down the differences.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg7311529041201683385"><div lang=3D"EN-US" style=3D"overflow-wrap: bre=
ak-word;"><div class=3D"m_7311529041201683385WordSection1"><p class=3D"MsoN=
ormal"><span style=3D"font-size:11pt"><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The third one is the =
=E2=80=98shallow=3D1=E2=80=99 parameter in SRC_URI. The problem is that git=
 fetcher does not support such parameter.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">In fetch2/git.py: ud.=
shallow =3D d.getVar(&quot;BB_GIT_SHALLOW&quot;) =3D=3D &quot;1&quot;<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">So I guess these coul=
d be removed? And switching to use BB_GIT_SHALLOW:pn-xxx =3D =E2=80=9C1=E2=
=80=9D?</span></p></div></div></div></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">No. I plan to add more sup=
port for that later, it just isn&#39;t ready yet. They will stay.<br><br></=
div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"m=
sg7311529041201683385"><div lang=3D"EN-US" style=3D"overflow-wrap: break-wo=
rd;"><div class=3D"m_7311529041201683385WordSection1"><p class=3D"MsoNormal=
"><span style=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">P.S.<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I sent a related patc=
h to bitbake:
<a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/18656" ta=
rget=3D"_blank">https://lists.openembedded.org/g/bitbake-devel/message/1865=
6</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">The problem in bitbak=
e is revealed by the current SRC_URI settings in meta-virt.<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">If you get similar er=
ror, you can apply the above patch.</span></p></div></div></div></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">If I was going to see that error, I would have already ...</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg731152904=
1201683385"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div c=
lass=3D"m_7311529041201683385WordSection1"><p class=3D"MsoNormal"><span sty=
le=3D"font-size:11pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Regards,<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Qi<u></u><u></u></spa=
n></p>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--00000000000064e0ae0647238c25--

