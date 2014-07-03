package alarm;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Event implements Serializable {
	private static final long serialVersionUID = 1L;
	private Type type;
	private int average;
	private int value;
	
	public Event(Type type, int average, int value) {
		this.type = type;
		this.average = average;
		this.value = value;
	}

	public Event(int average, int value) {
		this.average = average;
		this.value = value;
	}

	public Type getType() {
		return type;
	}

	public int getAverage() {
		return average;
	}
	
	public int getValue() {
		return value;
	}

	public byte[] getBytes() {
		byte[] yourBytes = {};
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ObjectOutput out = new ObjectOutputStream(bos);
			out.writeObject(this);
			yourBytes = bos.toByteArray();
			out.close();
			bos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return yourBytes;
	}
}