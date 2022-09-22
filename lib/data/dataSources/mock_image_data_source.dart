import 'dart:math';

class MockImageDataSource {
  static final _singleton = MockImageDataSource();

  static MockImageDataSource get instance => _singleton;

  static List<String> images = [
    "https://media.istockphoto.com/videos/portrait-of-old-muslim-man-video-id461186320?s=640x640",
    "https://muslimhands.org.uk/_ui/images/0e69504534d5.jpg",
    "https://i.pinimg.com/originals/e6/9f/14/e69f147beabcb2a089dd9ab2d18edf60.jpg",
    "https://external-preview.redd.it/8k6fjwBJMbZV2ERExCbhHo44WP8lh09zyF9TH7y3PZE.jpg?auto=webp&s=6e418a367d653ad935232a3619de944005e75613",
    "https://media.istockphoto.com/photos/portrait-of-traditional-muslim-man-with-beard-picture-id108149685?k=6&m=108149685&s=170667a&w=0&h=uuiizelAQ3TBNmS9uUl0MOWXQGFvfa_OykfPIvBITZY=",
    "https://res.cloudinary.com/blavity/image/upload/g_center,w_auto,q_auto:best,g_south_east,x_0/v1563826988/jtpupugg5dfj2g37svvk",
    "https://yt3.ggpht.com/-ZMzL6VrCKu8/AAAAAAAAAAI/AAAAAAAAAAA/wttr7IwbsZw/s900-c-k-no-mo-rj-c0xffffff/photo.jpg",
    "https://i.pinimg.com/236x/cf/d3/fe/cfd3fe9a773cd2bf6dd1d9432588e5b7.jpg",
    "https://cms.qz.com/wp-content/uploads/2017/03/rtx14uvs1-e1490868020159.jpg?quality=75&strip=all&w=410&h=231",
    "https://talktoislam.com/?qa=blob&qa_blobid=10378985844267793926",
    "https://1.bp.blogspot.com/_M_5Pmk5eXGo/R8NHYMxfFjI/AAAAAAAAARc/cucZlIf-bko/s400/muslimbeard.jpg",
    "https://t1.thpservices.com/fotos/thum400/022/803/ibr-1822475.jpg",
    "https://i.pinimg.com/originals/f3/6d/78/f36d7869856bdccc1831fed08bea7838.jpg",
    "https://c1.staticflickr.com/9/8210/8160518349_b2873130f1_b.jpg",
    "https://i.pinimg.com/originals/70/f6/b5/70f6b54dab3e8cb998dca4af2306c1ac.jpg",
    "https://i1.wp.com/becomingthealphamuslim.com/wp-content/uploads/2017/02/beard-with-shaved-head.png?resize=300%2C300",
    "https://images.freeimages.com/images/large-previews/f68/old-muslim-man-1555455.jpg",
    "https://i.pinimg.com/736x/0a/49/e0/0a49e002b30607efe0fdbbfbcd4e1c28--skull-central.jpg",
    "https://c1.staticflickr.com/9/8466/8127163491_4145934f34_b.jpg",
  ];

  static String mockImage() {
    final index = Random().nextInt(images.length - 1);
    return images[index];
  }
}
