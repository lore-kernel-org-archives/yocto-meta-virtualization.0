Subject: Building crun does not feth everything in do_fetch #meta-virtualization
To: meta-virtualization@lists.yoctoproject.org
From: "Marc Wiz" <mwyocto@wiz.com>
X-Originating-Location: Waco, Texas, US (72.48.16.26)
X-Originating-Platform: Linux Firefox 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 13 Oct 2021 07:18:54 -0700
Message-ID: <9VWo.1634134734913744504.HfhC@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="npMnffN1uA9vdy2KOkeh"

--npMnffN1uA9vdy2KOkeh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I recently discovered a couple of issues with building crun.

The first issue is when using a proxy to download source.=C2=A0=C2=A0 crun =
depends on libocispec which is a git sub-module.=C2=A0 The proxy environmen=
t variables are apparently not passed or recognized by the git sub-module c=
ode .=C2=A0 The fix is to add the proxy configuration into the git configur=
ation.

The real issue IMHO is that crun depends on libocispec which depends on yaj=
l.=C2=A0 Yajl is not downloaded until the compile task for crun is executed=
.=C2=A0 This breaks offline builds.

So I am wondering what the best way is to address this?=C2=A0 It seems to m=
e that the Makefiles for libocispec and yajl would need to be modified and =
the recipe for crun would need to be modified to fetch the dependencies.

Thanks,
Marc

--npMnffN1uA9vdy2KOkeh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I recently discovered a couple of issues with building crun.<br /><br />The=
 first issue is when using a proxy to download source.&nbsp;&nbsp; crun dep=
ends on libocispec which is a git sub-module.&nbsp; The proxy environment v=
ariables are apparently not passed or recognized by the git sub-module code=
 .&nbsp; The fix is to add the proxy configuration into the git configurati=
on.<br /><br />The real issue IMHO is that crun depends on libocispec which=
 depends on yajl.&nbsp; Yajl is not downloaded until the compile task for c=
run is executed.&nbsp; This breaks offline builds.<br /><br />So I am wonde=
ring what the best way is to address this?&nbsp; It seems to me that the Ma=
kefiles for libocispec and yajl would need to be modified and the recipe fo=
r crun would need to be modified to fetch the dependencies. <br /><br />Tha=
nks,<br />Marc

--npMnffN1uA9vdy2KOkeh--
