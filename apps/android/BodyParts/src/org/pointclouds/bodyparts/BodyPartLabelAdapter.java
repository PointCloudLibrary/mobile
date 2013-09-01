package org.pointclouds.bodyparts;

import android.app.Service;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

class BodyPartLabelAdapter extends ArrayAdapter<BodyPartLabel> {
    private final LayoutInflater inflater;
    private final BitmapDrawable[] icons;

    public BodyPartLabelAdapter(Context context, int textViewResourceId, BodyPartLabel[] objects) {
        super(context, textViewResourceId, objects);
        this.inflater = (LayoutInflater) context.getSystemService(Service.LAYOUT_INFLATER_SERVICE);

        float icon_height_px = -new Paint().getFontMetrics().ascent * 2
                * context.getResources().getDisplayMetrics().density;

        BodyPartLabel[] all_labels = BodyPartLabel.values();
        this.icons = new BitmapDrawable[all_labels.length];
        for (int i = 0; i < all_labels.length; ++i)
            icons[i] = buildIcon(all_labels[i], (int) icon_height_px);
    }

    private BitmapDrawable buildIcon(BodyPartLabel label, int size) {
        Bitmap bm = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        bm.eraseColor(label.color);
        return new BitmapDrawable(getContext().getResources(), bm);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        BodyPartLabel label = getItem(position);

        if (convertView == null) {
            convertView = inflater.inflate(R.layout.color_list_item, parent, false);
        }

        TextView color_name = (TextView) convertView;
        color_name.setText(label.toString());
        color_name.setCompoundDrawablesWithIntrinsicBounds(icons[position], null, null, null);

        return color_name;
    }
}
