Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C520E00A0A; Fri, 21 Apr 2017 11:03:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.181 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.181 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE58FE0083C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Apr 2017 11:03:27 -0700 (PDT)
Received: by mail-qt0-f181.google.com with SMTP id c45so75535866qtb.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Apr 2017 11:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pi/VjbH6FvOdBmg2tGlKvARiD0s5qElc+GZ34mfuTUs=;
	b=DkAbZcbs89eYgWOLmuivRndK2guyS7Uko0NMJ3HO/Oe8NCbBo2IdkRFSuqSYN5Yq7A
	gXOfKz5gBeSv6QvIxadBwoXTu7o+0XMVN/iY/Cx8fOEjYseOawWUYGYeQJxPR491NvR6
	P0U6mw2k35p+RrOn+MXas65GTVmGnGl/CQHEm1TGXVFa7Ocsh5QdMZj+i4Bt8BgElD+T
	TXPZ4U4hRAB3F9yR3+8XX98ZNVrvilZB651YCCPp3G0/5PvpYWu3W+4f+gr4MBhcDxbf
	QncDSo715fdqGIvYqaD+3v9sg5hCH9k/N7O6ZMhUzUXZLaoIVpSW7mekq4fMl3VXzOBt
	Bftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pi/VjbH6FvOdBmg2tGlKvARiD0s5qElc+GZ34mfuTUs=;
	b=FRkqOVw3H6Xh+Tt2GMt7S6Lifmv23KsP3i9h6eLxd7L267GzunriD13Rd1Th/wBR6R
	GZS24r2jDc3b+2/XpD6WelSZIzSFAYr3+vZUwemW+it5qwOSf30rwsbgk3MAIQlY7AYu
	LmCHo1B/q9mpi9Dy0eD301ssVeVFDFMWkWn3Yfo6pamsfQsQmBOdR6xzEBq8rJLk6/QL
	InqBQnStM9BR5ouCNpT0C1BiIbsFb6SWbCB+hz6peKPrZeo25a+PzysGZin/7yFsy0eB
	JUehIysAYuWUH5K5nUxm+pmjfCvuIzLlOamEEdLhi6rf9+E3thNkdJSInAwIIDxgrmPZ
	Z3Pg==
X-Gm-Message-State: AN3rC/6SkiD6k1HcLE2CROlFoCxM03KN6tjMAu7g3vFfo0OFeGDJnG75
	/vj2wruMLOVnOntmziSzLnTSkbmUiA==
X-Received: by 10.237.53.139 with SMTP id c11mr14359440qte.285.1492797806468; 
	Fri, 21 Apr 2017 11:03:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 21 Apr 2017 11:03:25 -0700 (PDT)
In-Reply-To: <CADM9VcugBHcqoTADm32TAFON8jCS-EYEJcgCuDQKc=b75HZrpQ@mail.gmail.com>
References: <CADM9VctCY=M2_HeiXh-e7CqZ2cibt2V3mUFGhe7xHJ=Zevi7iA@mail.gmail.com>
	<CADkTA4N6_OQwYVyH1qZAyMzRwBHxhpJNshxbjumkuhvcvWmVRw@mail.gmail.com>
	<CADM9VcugBHcqoTADm32TAFON8jCS-EYEJcgCuDQKc=b75HZrpQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2017 14:03:25 -0400
Message-ID: <CADkTA4PcrhFes+bksBr_8A=i2GrkbwzFpO+rRVzwRAKb3E8Jfw@mail.gmail.com>
To: Massimiliano Malisan <max.malisan.uk@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: LXD anyone?
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
X-List-Received-Date: Fri, 21 Apr 2017 18:03:30 -0000
Content-Type: multipart/alternative; boundary=001a11c008baf9e926054db1120b

--001a11c008baf9e926054db1120b
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 21, 2017 at 12:32 PM, Massimiliano Malisan <
max.malisan.uk@gmail.com> wrote:

> Hi,
>
> well, it's a bit complicated: being a newbie of both Yocto and go-lang
> when I started all this I wasn't aware of the introduction of go in the
> openembedded-core meta master (I am using morty). As I couldn't sort out
> quickly how to set up the recipe with the meta-virtualization go compiler I
> switched all the meta to use meta-golang (quite an easy task), which seemed
> to me much more easy to use and directly produced a building tree structure
> similar to the one I got from "go get" of LXD source (which I used as a
> reference to understand all the package's dependencies and go building
> structure).
>

I'm not so concerned about the variant of the go compiler used to build, as
long
as you found something that worked, it is something that we can merge.

But yes, anything we merge now should work with oe-core's go variant, since
that
is what we are standardizing on.


>
> Besides this:
> * I created a bunch of go recipes for all the dependencies (following the
> example of docker's recipe dependencies)
>

These can be submitted to meta-virt, but packaging too many support packages
isn't necessarily the right thing, since they can conflict with other go
packages that
need a similar dependency, but on another version.

The technique that I've been using to deal with this lately is to put
multiple upstream
repos on the SRC_URI and allow the fetcher to pull them into the SRC
directory, and
have them available to the build.

i.e. look at what I did for libnetwork in docker, you can do something
similar per-dependency
and use destsuffix= to get them in the right place (i.e. destsuffix=git/src/
github.com/openSUSE/umoci)


> * I added and/or updated few other recipes (some are added+updated from
> meta-cube)
>

These can be sent here, or sent as a pull request on the OverC github
pages, if you send
them here, make sure to have [meta-cube] in the subject. Or go right for
the github pull
request.


> * I added/changed some system configuration files
>

We'd have to look at those closely, system level config is something that
either needs to
be controlled by packageconfigs, or is a distro policy. So they may not be
something
that you need to send at all.


> * I added some kernel modules - but without a real knowledge of which are
> strictly needed: I just checked those needed by docker (using the checking
> script from coreos docker's repo -- https://github.com/coreos/d
> ocker/blob/master/contrib/check-config.sh) and created corresponding
> kernel scc and cfg files (I also updated the docker's ones but this is a
> collateral and I don't know if it's needed).
>

That would be fine, following what we do for docker makes sense.


>
> Now I got a bit more insight on the overall process I may try to update
> the recipes to use the new go compiler structure (but for the moment I
> still need to keep it working for morty.. and I wouldn't like to keep two
> different versions of the recipes).
>
> By the way, now LXD seems to be working on my test image; there are still
> few thing I have to do manually after the installation (which should be
> automatized within the building process and I haven't been able to, yet)
> and few "side" things missing:
> * I could not build criu (as per previous message to the list) which is
> indicated as a tool to be used together with LXD on the build instructions
>

unless you are doing container migration or snapshots, you can ignore it,
and even make
it an optional dependency.


> * I have not been able to use it with apparmor (I didn't manage to build
> it from the meta-security)
>

this would be optional anyway, apparmor is a distro type config, and
building it in, or out, of
LXD would be a packageconfig or distro feature.


> * In his blog, LXD main developer suggests to use ZFS as ideal container
> fs but it's currently missing from Yocto...
>

I wouldn't worry about this either, we can't dictate the FS that people
use, so the recipes need
to be generic and that's up to the distro or image assembler.


>
> If all this seems reasonable (and if you give me some links where to read
> how to upload or send the recipes and patches I did) I will be happy to
> contribute..
>
>
See above. You can send them via git send-email, or github pull requests.
Instructions on how to
send the patches should be in the README of meta-virt.

Cheers,

Bruce


> Cheers,
>     Max
>
>
> On 20 April 2017 at 16:10, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>>
>>
>> On Thu, Apr 20, 2017 at 10:00 AM, Massimiliano Malisan <
>> max.malisan.uk@gmail.com> wrote:
>>
>>> Hi all,
>>>
>>> is anyone currently working on creating a recipe for LXD?
>>>
>>
>> We started creating one about a year ago (and it was discussed, but I
>> can't find a reference now) .. but that effort never did make it into the
>> tree and has bit rotted now.
>>
>> So if you have something underway, and are looking for input, feel free
>> to post RFC patches and we can see what's working (or not!).
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>>
>>> I have been working on one in the last days but I still have some issues
>>> to have it run properly; being quite new to Yocto I am not sure if they
>>> depend on something in my recipe or some other missing dependency or
>>> configuration, so any other voice is more than welcome.
>>>
>>> Cheers,
>>>     Max
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11c008baf9e926054db1120b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Apr 21, 2017 at 12:32 PM, Massimiliano Malisan <span dir=3D"ltr=
">&lt;<a href=3D"mailto:max.malisan.uk@gmail.com" target=3D"_blank">max.mal=
isan.uk@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>well, it&#39;s a =
bit complicated: being a newbie of both Yocto and go-lang when I started al=
l this I wasn&#39;t aware of the introduction of go in the openembedded-cor=
e meta master (I am using morty).=C2=A0As I couldn&#39;t sort out quickly h=
ow to set up the recipe with the meta-virtualization go compiler I switched=
 all the meta to use meta-golang (quite an easy task), which seemed to me m=
uch more easy to use and directly produced a building tree structure simila=
r to the one I got from &quot;go get&quot; of LXD source (which I used as a=
 reference to understand all the package&#39;s dependencies and go building=
 structure).</div></div></blockquote><div><br></div><div>I&#39;m not so con=
cerned about the variant of the go compiler used to build, as long</div><di=
v>as you found something that worked, it is something that we can merge.</d=
iv><div><br></div><div>But yes, anything we merge now should work with oe-c=
ore&#39;s go variant, since that</div><div>is what we are standardizing on.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div><br></div><div>Besides this:</div><div>* I created a bu=
nch of go recipes for all the dependencies (following the example of docker=
&#39;s recipe dependencies)</div></div></blockquote><div><br></div><div>The=
se can be submitted to meta-virt, but packaging too many support packages</=
div><div>isn&#39;t necessarily the right thing, since they can conflict wit=
h other go packages that</div><div>need a similar dependency, but on anothe=
r version.</div><div><br></div><div>The technique that I&#39;ve been using =
to deal with this lately is to put multiple upstream</div><div>repos on the=
 SRC_URI and allow the fetcher to pull them into the SRC directory, and</di=
v><div>have them available to the build.</div><div><br></div><div>i.e. look=
 at what I did for libnetwork in docker, you can do something similar per-d=
ependency</div><div>and use destsuffix=3D to get them in the right place (i=
.e. destsuffix=3Dgit/src/<a href=3D"http://github.com/openSUSE/umoci">githu=
b.com/openSUSE/umoci</a>)</div>







<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>* I added and/or updated few other recipes (some are added+up=
dated from meta-cube)</div></div></blockquote><div><br></div><div>These can=
 be sent here, or sent as a pull request on the OverC github pages, if you =
send</div><div>them here, make sure to have [meta-cube] in the subject. Or =
go right for the github pull</div><div>request.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>* I adde=
d/changed some system configuration files</div></div></blockquote><div><br>=
</div><div>We&#39;d have to look at those closely, system level config is s=
omething that either needs to</div><div>be controlled by packageconfigs, or=
 is a distro policy. So they may not be something</div><div>that you need t=
o send at all.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div>* I added some kernel modules - but witho=
ut a real knowledge of which are strictly needed: I just checked those need=
ed by docker (using the checking script from coreos docker&#39;s repo --=C2=
=A0<a href=3D"https://github.com/coreos/docker/blob/master/contrib/check-co=
nfig.sh" target=3D"_blank">https://github.com/coreos/d<wbr>ocker/blob/maste=
r/contrib/chec<wbr>k-config.sh</a>) and created corresponding kernel scc an=
d cfg files (I also updated the docker&#39;s ones but this is a collateral =
and I don&#39;t know if it&#39;s needed).</div></div></blockquote><div><br>=
</div><div>That would be fine, following what we do for docker makes sense.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div><br></div><div>Now I got a bit more insight on the over=
all process I may try to update the recipes to use the new go compiler stru=
cture (but for the moment I still need to keep it working for morty.. and I=
 wouldn&#39;t like to keep two different versions of the recipes).</div><di=
v><br></div><div>By the way, now LXD seems to be working on my test image; =
there are still few thing I have to do manually after the installation (whi=
ch should be automatized within the building process and I haven&#39;t been=
 able to, yet) and few &quot;side&quot; things missing:</div><div>* I could=
 not build criu (as per previous message to the list) which is indicated as=
 a tool to be used together with LXD on the build instructions</div></div><=
/blockquote><div><br></div><div>unless you are doing container migration or=
 snapshots, you can ignore it, and even make</div><div>it an optional depen=
dency.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>* I have not been able to use it with apparmor (I=
 didn&#39;t manage to build it from the meta-security)</div></div></blockqu=
ote><div><br></div><div>this would be optional anyway, apparmor is a distro=
 type config, and building it in, or out, of=C2=A0</div><div>LXD would be a=
 packageconfig or distro feature.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>* In his blog, LXD m=
ain developer suggests to use ZFS as ideal container fs but it&#39;s curren=
tly missing from Yocto...</div></div></blockquote><div><br></div><div>I wou=
ldn&#39;t worry about this either, we can&#39;t dictate the FS that people =
use, so the recipes need</div><div>to be generic and that&#39;s up to the d=
istro or image assembler.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>If all this see=
ms reasonable (and if you give me some links where to read how to upload or=
 send the recipes and patches I did) I will be happy to contribute..</div><=
div><br></div></div></blockquote><div><br></div><div>See above. You can sen=
d them via git send-email, or github pull requests. Instructions on how to<=
/div><div>send the patches should be in the README of meta-virt.</div><div>=
<br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></=
div><div>Cheers,</div><div>=C2=A0 =C2=A0 Max</div><div><div class=3D"gmail-=
h5"><div><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On 20 April 2017 at 16:10, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote"><span>On Thu, Apr 20, 2017 at 10:00 AM, Massimiliano Malisan <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:max.malisan.uk@gmail.com" target=3D"_bla=
nk">max.malisan.uk@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi all,=C2=A0<br></div><=
div><br></div><div>is anyone currently working on creating a recipe for LXD=
?<br></div></div></blockquote><div><br></div></span><div>We started creatin=
g one about a year ago (and it was discussed, but I can&#39;t find a refere=
nce now) .. but that effort never did make it into the tree and has bit rot=
ted now.<br></div><div><br></div><div>So if you have something underway, an=
d are looking for input, feel free to post RFC patches and we can see what&=
#39;s working (or not!).</div><div><br></div><div>Cheers,</div><div><br></d=
iv><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span><div dir=3D"ltr"><div></div><div><br></div><div>I have bee=
n working on one in the last days but I still have some issues to have it r=
un properly; being quite new to Yocto I am not sure if they depend on somet=
hing in my recipe or some other missing dependency or configuration, so any=
 other voice is more than welcome.</div><div><br></div><div>Cheers,</div><d=
iv>=C2=A0 =C2=A0 Max</div></div>
<br></span><span class=3D"gmail-m_-3662302077156098124gmail-m_-404068910621=
9897799gmail-m_-9192282963934996079HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"gmail-m_-36623020771560=
98124gmail-m_-4040689106219897799gmail-m_-9192282963934996079HOEnZb"><font =
color=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D=
"gmail-m_-3662302077156098124gmail-m_-4040689106219897799gmail-m_-919228296=
3934996079m_-7939722327411209343gmail_signature">&quot;Thou shalt not follo=
w the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br></div></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11c008baf9e926054db1120b--
